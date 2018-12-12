# -*- coding: UTF-8 -*-
"""
python find_enrichment.py study.file population.file gene-association.file

This program returns P-values for functional enrichment in a cluster of study
genes using Fisher's exact test, and corrected for multiple testing (including
Bonferroni, Holm, Sidak, and false discovery rate).

About significance cutoff:
--alpha: test-wise alpha; for each GO term, what significance level to apply
        (most often you don't need to change this other than 0.05 or 0.01)
--pval: experiment-wise alpha; for the entire experiment, what significance
        level to apply after Bonferroni correction
"""

from __future__ import print_function

__copyright__ = "Copyright (C) 2010-2018, H Tang et al. All rights reserved."
__author__ = "various"

import os
import sys
import re
import argparse

from goatools.obo_parser import GODag
from goatools.go_enrichment import GOEnrichmentStudy
from goatools.associations import read_associations
from goatools.multiple_testing import Methods
from goatools.pvalcalc import FisherFactory
from goatools.rpt.goea_nt_xfrm import MgrNtGOEAs
from goatools.rpt.prtfmt import PrtFmt
from goatools.semantic import TermCounts
from goatools.wr_tbl import prt_tsv_sections

from goatools.gosubdag.gosubdag import GoSubDag
from goatools.grouper.read_goids import read_sections
from goatools.grouper.grprdflts import GrouperDflts
from goatools.grouper.hdrgos import HdrgosSections
from goatools.grouper.grprobj import Grouper
from goatools.grouper.sorter import Sorter
from goatools.grouper.aart_geneproducts_all import AArtGeneProductSetsAll
from goatools.grouper.wr_sections import WrSectionsTxt
from goatools.grouper.wrxlsx import WrXlsxSortedGos


# pylint: disable=too-few-public-methods
class GoeaCliArgs(object):
    """Extracts arguments from the command-line."""

    def __init__(self):
        self.args = self._init_args()

    def _init_args(self):
        """Get enrichment arg parser."""

        #pylint: disable=invalid-name
        p = argparse.ArgumentParser(__doc__,
                                    formatter_class=argparse.ArgumentDefaultsHelpFormatter)

        p.add_argument('filenames', type=str, nargs=3,
                       help='data/study data/population data/association')
        p.add_argument('--alpha', default=0.05, type=float,
                       help='Test-wise alpha for multiple testing')
        p.add_argument('--pval', default=.05, type=float,
                       help='Only print results with uncorrected p-value < PVAL.')
        p.add_argument('--pval_field', type=str,
                       help='Only print results when PVAL_FIELD < PVAL.')
        p.add_argument('--outfile', default=None, type=str,
                       help='Write enrichment results into xlsx or tsv file')
        p.add_argument('--id2sym', default=None, type=str,
                       help='ASCII file containing one geneid and its symbol per line')
        p.add_argument('--sections', default=None, type=str,
                       help=('Use sections file for printing grouped GOEA results. '
                             'Example SECTIONS values:\n'
                             'goatools.test_data.sections.gjoneska_pfenning \n'
                             'goatools/test_data/sections/gjoneska_pfenning.py \n'
                             'data/gjoneska_pfenning/sections_in.txt\n'))
        p.add_argument('--outfile_detail', type=str,
                       help=('Write enrichment results into a text file \n'
                             'containing the following information: \n'
                             '1) GOEA GO terms, grouped into sections \n\n'
                             '2) List of genes and ASCII art showing section membership \n'
                             '3) Detailed list of each gene and GO terms w/their P-values \n'))
        p.add_argument('--compare', dest='compare', default=False,
                       action='store_true',
                       help="the population file as a comparison group. if this "
                       "flag is specified, the population is used as the study "
                       "plus the `population/comparison`")
        p.add_argument('--ratio', dest='ratio', type=float, default=None,
                       help="only show values where the difference between study "
                       "and population ratios is greater than this. useful for "
                       "excluding GO categories with small differences, but "
                       "containing large numbers of genes. should be a value "
                       "between 1 and 2. ")
        p.add_argument('--indent', dest='indent', default=False,
                       action='store_true', help="indent GO terms")
        p.add_argument('--obo', default="go-basic.obo", type=str,
                       help="Specifies location and name of the obo file")
        p.add_argument('--no_propagate_counts', default=False, action='store_true',
                       help="Do not propagate counts to parent terms")
        p.add_argument('--method', default="bonferroni,sidak,holm,fdr_bh", type=str,
                       help=Methods().getmsg_valid_methods())
        p.add_argument('--pvalcalc', default="fisher", type=str,
                       help=str(FisherFactory()))
        p.add_argument('--min_overlap', default=0.7, type=float,
                       help="Check that a minimum amount of study genes are in the population")
        p.add_argument('--goslim', default='goslim_generic.obo', type=str,
                       help="The GO slim file is used when grouping GO terms.")

        if len(sys.argv) == 1:
            sys.exit(not p.print_help())

        args = p.parse_args()  # Namespace object from argparse
        self._check_input_files(args, p)
        return args

    @staticmethod
    def _check_input_files(nspc, parser):
        """check filename args. otherwise if one of the 3 filenames is bad
        it's hard to tell which one"""
        if not len(nspc.filenames) == 3:
            parser.print_help()
            msg = """
      3 Expected files; Expected content: study population association",
      {} Actual   files: {}""".format(len(nspc.filenames), ' '.join(nspc.filenames))
            raise Exception(msg)
        for fin in nspc.filenames:
            if not os.path.exists(fin):
                return "*{}* does not exist".format(fin)

        return False


class GoeaCliFnc(object):
    """For running a GOEA on the command-line."""

    def __init__(self, args):
        self.args = args
        self.sections = read_sections(self.args.sections) if self.args.sections else None
        _optional_attrs = ['relationship'] if self.sections else None
        self.godag = GODag(obo_file=self.args.obo, optional_attrs=_optional_attrs)
        # Get GOEnrichmentStudy
        _study, _pop, _assoc = self.rd_files()
        if not self.args.compare:  # sanity check
            self.chk_genes(_study, _pop)
        self.methods = self.args.method.split(",")
        self.itemid2name = self._init_itemid2name()
        self.objgoea = self._init_objgoea(_pop, _assoc)
        # Run GOEA
        self.results_all = self.objgoea.run_study(_study)
        # Prepare for grouping, if user-specified. Create GroupItems
        self.prepgrp = GroupItems(_assoc, self, self.godag.version) if self.sections else None

    def _init_itemid2name(self):
        """Print gene symbols instead of gene IDs, if provided."""
        if not hasattr(self.args, 'id2sym'):
            return None
        fin_id2sym = self.args.id2sym
        if fin_id2sym is not None and os.path.exists(fin_id2sym):
            id2sym = {}
            cmpl = re.compile(r'^\s*(\S+)[\s,;]+(\S+)')
            with open(fin_id2sym) as ifstrm:
                for line in ifstrm:
                    mtch = cmpl.search(line)
                    if mtch:
                        id2sym[mtch.group(1)] = mtch.group(2)
            return id2sym

    def prt_results(self, goea_results):
        """Print GOEA results to the screen or to a file."""
        # objaart = self.prepgrp.get_objaart(goea_results) if self.prepgrp is not None else None
        if self.args.outfile is None:
            self._prt_results(goea_results)
        else:
            # Users can print to both tab-separated file and xlsx file in one run.
            outfiles = self.args.outfile.split(",")
            grpwr = self.prepgrp.get_objgrpwr(goea_results) if self.prepgrp else None
            if grpwr is None:
                self.prt_outfiles_flat(goea_results, outfiles)
            else:
                grpwr.prt_outfiles_grouped(outfiles)

    def prt_outfiles_flat(self, goea_results, outfiles):
        """Write to outfiles."""
        kws = {'indent':self.args.indent, 'itemid2name':self.itemid2name}
        for outfile in outfiles:
            if outfile.endswith(".xlsx"):
                self.objgoea.wr_xlsx(outfile, goea_results, **kws)
            #elif outfile.endswith(".txt"):  # TBD
            #    pass
            else:
                self.objgoea.wr_tsv(outfile, goea_results, **kws)

    def _prt_results(self, goea_results):
        """Print GOEA results to the screen."""
        min_ratio = self.args.ratio
        if min_ratio is not None:
            assert 1 <= min_ratio <= 2
        # print("MMMMMMMMMMMMMMMMMMMMMM", min_ratio)
        self.objgoea.print_date(min_ratio=min_ratio, pval=self.args.pval)
        results_adj = self.objgoea.get_adj_records(goea_results, min_ratio, self.args.pval)
        if results_adj:
            #### kws = {'indent':self.args.indent, 'itemid2name':self.itemid2name}
            if not self.prepgrp:
                self.objgoea.print_results_adj(results_adj, self.args.indent)
            else:
                grpwr = self.prepgrp.get_objgrpwr(results_adj)
                grpwr.prt_txt(sys.stdout)

    def get_results(self):
        """Given all GOEA results, return the significant results (< pval)."""
        return self.get_results_sig() if self.args.pval != -1.0 else self.results_all

    def _init_objgoea(self, pop, assoc):
        """Run gene ontology enrichment analysis (GOEA)."""
        propagate_counts = not self.args.no_propagate_counts
        return GOEnrichmentStudy(pop, assoc, self.godag,
                                 propagate_counts=propagate_counts,
                                 alpha=self.args.alpha,
                                 pvalcalc=self.args.pvalcalc,
                                 methods=self.methods)

    def chk_genes(self, study, pop):
        """Check gene sets."""
        if len(pop) < len(study):
            exit("\nERROR: The study file contains more elements than the population file. "
                 "Please check that the study file is a subset of the population file.\n")
        # check the fraction of genomic ids that overlap between study and population
        overlap = self.get_overlap(study, pop)
        if overlap < 0.95:
            sys.stderr.write("\nWARNING: only {} fraction of genes/proteins in study are found in "
                             "the population  background.\n\n".format(overlap))
        if overlap <= self.args.min_overlap:
            exit("\nERROR: only {} of genes/proteins in the study are found in the "
                 "background population. Please check.\n".format(overlap))

    def get_results_sig(self):
        """Get significant results."""
        # Only print results when uncorrected p-value < this value.
        print("{N:7,} of {M:,} results have uncorrected P-values <= {PVAL}=pval\n".format(
            N=sum(1 for r in self.results_all if r.p_uncorrected < self.args.pval),
            M=len(self.results_all),
            PVAL=self.args.pval))
        pval_fld = self.get_pval_field()
        results = [r for r in self.results_all if getattr(r, pval_fld) <= self.args.pval]
        return results

    @staticmethod
    def get_overlap(study, pop):
        """Get he ratio of study genes which are in the population."""
        return float(len(study & pop)) / len(study)

    def get_pval_field(self):
        """Get 'p_uncorrected' or the user-specified field for determining significant results."""
        pval_fld = self.args.pval_field
        # If --pval_field [VAL] was specified
        if pval_fld is not None:
            if pval_fld[:2] != 'p_':
                pval_fld = 'p_' + pval_fld
        # If only one method was used, use that instead of the uncorrected pvalue
        elif len(self.methods) == 1:
            pval_fld = 'p_' + self.methods[0]
        # Use 'uncorrected pvalue' if there are many methods & none chosen using --pval_field
        else:
            pval_fld = 'p_uncorrected'
        if self.results_all:
            assert hasattr(next(iter(self.results_all)), pval_fld), \
                'NO PVAL({P}). EXPECTED ONE OF: {E}'.format(
                    P=self.args.pval_field,
                    E=" ".join([k for k in dir(next(iter(self.results_all))) if k[:2] == 'p_']))
        return pval_fld

    def rd_files(self):
        """Read files and return study and population."""
        study_fn, pop_fn, assoc_fn = self.args.filenames
        assoc = read_associations(assoc_fn)
        study, pop = self._read_geneset(study_fn, pop_fn)
        print("Study: {0} vs. Population {1}\n".format(len(study), len(pop)))
        return study, pop, assoc

    def _read_geneset(self, study_fn, pop_fn):
        """Open files containing genes. Return study genes and population genes."""
        pop = set(_.strip() for _ in open(pop_fn) if _.strip())
        study = frozenset(_.strip() for _ in open(study_fn) if _.strip())
        # some times the pop is a second group to compare, rather than the
        # population in that case, we need to make sure the overlapping terms
        # are removed first
        if self.args.compare:
            common = pop & study
            pop |= study
            pop -= common
            study -= common
            sys.stderr.write("removed %d overlapping items\n" % (len(common)))
            sys.stderr.write("Set 1: {0}, Set 2: {1}\n".format(
                len(study), len(pop)))
        return study, pop

class GroupItems(object):
    """Prepare for grouping, if specified by the user."""

    def __init__(self, gene2gos, objcli, godag_version):
        # _goids = set(o.id for o in godag.values() if not o.children)
        _goids = set(r.GO for r in objcli.results_all)
        _tobj = TermCounts(objcli.godag, gene2gos)
        # pylint: disable=line-too-long
        self.gosubdag = GoSubDag(_goids, objcli.godag, relationships=True, tcntobj=_tobj, prt=sys.stdout)
        self.grprdflt = GrouperDflts(self.gosubdag, objcli.args.goslim)
        self.hdrobj = HdrgosSections(self.grprdflt.gosubdag, self.grprdflt.hdrgos_dflt, objcli.sections)
        self.pval_fld = objcli.get_pval_field()  # primary pvalue of interest
        self.ver_list = [godag_version,
                         self.grprdflt.ver_goslims,
                         "Sections: {S}".format(S=objcli.args.sections)]
        # self.objaartall = self._init_objaartall()

    def get_objgrpwr(self, goea_results):
        """Get a GrpWr object to write grouped GOEA results."""
        sortobj = self.get_sortobj(goea_results)
        return GrpWr(sortobj, self.pval_fld, ver_list=self.ver_list)

    def get_sortobj(self, goea_results, **kws):
        """Return a Grouper object, given a list of GOEnrichmentRecord."""
        nts_goea = MgrNtGOEAs(goea_results).get_goea_nts_prt(**kws)
        goids = set(nt.GO for nt in nts_goea)
        go2nt = {nt.GO:nt for nt in nts_goea}
        grprobj = Grouper("GOEA", goids, self.hdrobj, self.grprdflt.gosubdag, go2nt=go2nt)
        grprobj.prt_summary(sys.stdout)
        # hdrgo_prt", "section_prt", "top_n", "use_sections"
        sortobj = Sorter(grprobj, section_sortby=lambda nt: getattr(nt, self.pval_fld))
        return sortobj

    @staticmethod
    def get_objaart(goea_results, **kws):
        """Return a AArtGeneProductSetsOne object."""
        nts_goea = MgrNtGOEAs(goea_results).get_goea_nts_prt(**kws)
        # objaart = AArtGeneProductSetsOne(name, goea_nts, self)

    def _init_objaartall(self):
        """Get background database info for making ASCII art."""
        kws = {
            'sortgo':lambda nt: [nt.NS, nt.dcnt],
            # fmtgo=('{p_fdr_bh:8.2e} {GO} '
            # Formatting for GO terms in grouped GO list
            'fmtgo':('{hdr1usr01:2} {NS} {GO} {s_fdr_bh:8} '
                     '{dcnt:5} {childcnt:3} R{reldepth:02} '
                     '{D1:5} {GO_name} ({study_count} study genes)\n'),
            # Formatting for GO terms listed under each gene
            'fmtgo2':('{hdr1usr01:2} {NS} {GO} {s_fdr_bh:8} '
                      '{dcnt:5} R{reldepth:02} '
                      '{GO_name} ({study_count} study genes)\n'),
            # itemid2name=ensmusg2symbol}
            }
        return AArtGeneProductSetsAll(self.grprdflt, self.hdrobj, **kws)

class GrpWr(object):
    """Write GO term GOEA information, grouped."""

    def __init__(self, sortobj, pval_fld, ver_list):
        self.sortobj = sortobj
        self.pval_fld = pval_fld
        self.ver_list = ver_list
        self.objprt = PrtFmt()
        self.flds_all = next(iter(self.sortobj.grprobj.go2nt.values()))._fields
        self.flds_cur = self._init_flds_cur()
        self.desc2nts = self.sortobj.get_desc2nts(hdrgo_prt=False)
        # print("nnnnnnnnnnnnnnnnnnnnnttttttttttttttttt", self.flds_all)

    def prt_outfiles_grouped(self, outfiles):
        """Write to outfiles."""
        for outfile in outfiles:
            if outfile.endswith(".xlsx"):
                self.wr_xlsx(outfile)
            elif outfile.endswith(".txt"):
                self.wr_txt(outfile)
            else:
                self.wr_tsv(outfile)

    def wr_xlsx(self, fout_xlsx):
        """Print grouped GOEA results into an xlsx file."""
        objwr = WrXlsxSortedGos("GOEA", self.sortobj)
        #### fld2fmt['ratio_in_study'] = '{:>8}'
        #### fld2fmt['ratio_in_pop'] = '{:>12}'
        #### ntfld2wbfmtdict = {
        # ntfld_wbfmt = {
        #     'ratio_in_study': {'align':'right'},
        #     'ratio_in_pop':{'align':'right'}}
        kws_xlsx = {
            'title': self.ver_list,
            'fld2fmt': {f:'{:8.2e}' for f in self.flds_cur if f[:2] == 'p_'},
            #'ntfld_wbfmt': ntfld_wbfmt,
            #### 'ntval2wbfmtdict': ntval2wbfmtdict,
            #'hdrs': [],
            'prt_flds': self.flds_cur}
        objwr.wr_xlsx_nts(fout_xlsx, self.desc2nts, **kws_xlsx)

    def wr_tsv(self, fout_tsv):
        """Print grouped GOEA results into a tab-separated file."""
        with open(fout_tsv, 'w') as prt:
            kws_tsv = {
                'fld2fmt': {f:'{:8.2e}' for f in self.flds_cur if f[:2] == 'p_'},
                'prt_flds':self.flds_cur}
            prt_tsv_sections(prt, self.desc2nts['sections'], **kws_tsv)
            print("  WROTE: {TSV}".format(TSV=fout_tsv))

    def wr_txt(self, fout_txt):
        """Write to a file GOEA results in an ASCII text format."""
        with open(fout_txt, 'w') as prt:
            for line in self.ver_list:
                prt.write("{LINE}\n".format(LINE=line))
            self.prt_txt(prt)
            print("  WROTE: {TXT}".format(TXT=fout_txt))

    def prt_tsv(self, prt=sys.stdout):
        """Print an ASCII text format."""
        prtfmt = self.objprt.get_prtfmt_str(self.flds_cur)
        prt.write("{FLDS}\n".format(FLDS=" ".join(self.flds_cur)))
        WrSectionsTxt.prt_sections(prt, self.desc2nts['sections'], prtfmt, secspc=True)

    def prt_txt(self, prt=sys.stdout):
        """Print an ASCII text format."""
        prtfmt = self.objprt.get_prtfmt_str(self.flds_cur)
        prt.write("{FLDS}\n".format(FLDS=" ".join(self.flds_cur)))
        WrSectionsTxt.prt_sections(prt, self.desc2nts['sections'], prtfmt, secspc=True)

    def _init_flds_cur(self):
        """Choose fields to print from a multitude of available fields."""
        flds = []
        # ('GO', 'NS', 'enrichment', 'name', 'ratio_in_study', 'ratio_in_pop', 'depth',
        # 'p_uncorrected', 'p_bonferroni', 'p_sidak', 'p_holm', 'p_fdr_bh',
        # 'pop_n', 'pop_count', 'pop_items'
        # 'study_n', 'study_count', 'study_items',
        # 'is_ratio_different', 'level', 'is_obsolete',
        # 'namespace', 'reldepth', 'alt_ids', 'format_txt', 'hdr_idx',
        # 'is_hdrgo', 'is_usrgo', 'num_usrgos', 'hdr1usr01', 'alt', 'GO_name',
        # 'dcnt', 'D1', 'tcnt', 'tfreq', 'tinfo', 'childcnt', 'REL',
        # 'REL_short', 'rel', 'id')
        flds0 = ['GO', 'NS', 'enrichment', self.pval_fld, 'dcnt', 'tinfo', 'depth',
                 'ratio_in_study', 'ratio_in_pop', 'name']
        flds_p = [f for f in self.flds_all if f[:2] == 'p_' and f != self.pval_fld]
        flds.extend(flds0)
        if flds_p:
            flds.extend(flds_p)
        flds.append('study_count')
        flds.append('study_items')
        return flds


# Copyright (C) 2010-2018, H Tang et al. All rights reserved.
