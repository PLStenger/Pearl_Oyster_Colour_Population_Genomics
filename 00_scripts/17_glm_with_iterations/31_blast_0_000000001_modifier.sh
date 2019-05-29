#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm_without_iteration
BLAST_PROGRAM=blastx
ALIGNMENTS=3
BLAST_PARAM="-evalue 1e-3"
BANK=/home/ref-bioinfo/beedeem/p/NCBI_nr/current/NCBI_nr/NCBI_nr


# Activation de l'environnement BLAST+ 2.6.0
. /appli/bioinfo/blast/2.6.0/env.sh

for FILE in $(ls $DATADIRECTORY/*dat_P_0_000000001.txt.vcf_SNPEff_genes_summary.txt_modifier_fasta_nucleotids.txt)


do

CB_NAME=${FILE##*/}
CB_TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
CB_LOG_FOLDER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/11_blast_without_iteration/modifier/"$CB_TIMESTAMP"_"$CB_NAME"
mkdir -p $CB_LOG_FOLDER
cp $0 $CB_LOG_FOLDER/$CB_NAME
OUT_FILE=${FILE##*/}_result.txt

BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive1.asn1
${BLAST_PROGRAM} -query "$DATADIRECTORY/${FILE##*/}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"

done ;
