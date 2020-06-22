#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

#cd /home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data
cd /home1/scratch/plstenge/genome

#awk '
#    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
#    NR==FNR{a[$1]          # hash $1 of genes file to a
#    next
#}
#($1 in a) {                # lookup from transcriptome
#    print
#}' selected_snp_for_validation.txt sspace.final.scaffolds_database.txt > selected_snp_for_validation_with_sequences.txt


##############################################################################################################################
################## upstream

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 1-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 1-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 1-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 1-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 1-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 1-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 1-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 1-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 1-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 1-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 1-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 1-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 1-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 1-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 1-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 1-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 1-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 1-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 2-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 2-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 2-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 2-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 2-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 2-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 2-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 2-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 2-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 2-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 2-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 2-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 2-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 2-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 2-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 2-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 2-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 2-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 3-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 3-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 3-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 3-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 3-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 3-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 3-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 3-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 3-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 3-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 3-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 3-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 3-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 3-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 3-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 3-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream_02.gff 3-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 3-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt




##############################################################################################################################
################## downstream

awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 1-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 1-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 1-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 1-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 1-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 1-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 1-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 1-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 1-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 1-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 1-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 1-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 1-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 1-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 1-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 1-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 1-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 1-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 2-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 2-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 2-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 2-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 2-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 2-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 2-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 2-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 2-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 2-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 2-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 2-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 2-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 2-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 2-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 2-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 2-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 2-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 3-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 3-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 3-J-2_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 3-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 3-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 3-J-7_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 3-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 3-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 3-R-180_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 3-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 3-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 3-R-183_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 3-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 3-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 3-V-613_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 3-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_downstream_02.gff 3-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_02.gff > 3-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_downstream.txt




