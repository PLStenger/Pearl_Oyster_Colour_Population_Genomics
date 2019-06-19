#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

# activate parallel
export PATH=$PATH:/appli/anaconda/2.7/bin
source activate /home1/datawork/plstenge/96_env_conda/freebayes

# Activation de l'environnement BLAST+ 2.6.0
. /appli/bioinfo/blast/2.6.0/env.sh

# Global variables
SEQUENCE_FILE=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/10_00_annotation_go/go_enrichment-master/03_sequences/analyzed_genes.fasta
SWISSPROT_RESULT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/10_00_annotation_go/go_enrichment-master/04_blast_results/analyzed_genes.swissprot
SWISSPROT_HITS=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/10_00_annotation_go/go_enrichment-master/04_blast_results/analyzed_genes.hits
SWISSPROT_DB=/home/ref-bioinfo/beedeem/p/Uniprot_SwissProt/current/Uniprot_SwissProt
#BANK=/home/ref-bioinfo/beedeem/p/NCBI_nr/current/NCBI_nr/NCBI_nr

# Blast all sequences against swissprot (must be installed locally)
# WARNING use `-j N` if you need to limit the number of CPUs used to N <integer>
cat $SEQUENCE_FILE | parallel -k --block 1k --recstart '>' --pipe 'blastx -db '$SWISSPROT_DB' -query - -evalue 1e-3 -outfmt 6 -max_target_seqs 1' > $SWISSPROT_RESULT
#cat $SEQUENCE_FILE | --pipe 'blastx -db '$SWISSPROT_DB' -query - -evalue 1e-3 -outfmt 6 -max_target_seqs 1' > $SWISSPROT_RESULT


# TODO filter blasts on similarity, evalue, length...

# Extract analyzed_genes.hits
awk '{print $1,$2}' $SWISSPROT_RESULT | uniq > $SWISSPROT_HITS
