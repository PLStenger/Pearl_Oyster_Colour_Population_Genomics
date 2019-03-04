#!/usr/bin/env bash
#PBS -q mpi
#PBS -l select=1:ncpus=28:mpiprocs=28:mem=60gb
#PBS -l walltime=48:00:00




QUERY_RvsJ_Pvalue0.001_HIGHER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/RvsJ_Pvalue0.001_HIGHER.txt
QUERY_RvsJ_Pvalue0.001_MODIFIER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/RvsJ_Pvalue0.001_MODIFIER.txt
QUERY_VvsJ_Pvalue0.001_HIGHER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/VvsJ_Pvalue0.001_HIGHER.txt
QUERY_VvsJ_Pvalue0.001_MODIFIER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/VvsJ_Pvalue0.001_MODIFIER.txt
QUERY_VvsR_Pvalue0.001_HIGHER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/VvsR_Pvalue0.001_HIGHER.txt
QUERY_VvsR_Pvalue0.001_MODIFIER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/VvsR_Pvalue0.001_MODIFIER.txt
OUT_FILE_RvsJ_Pvalue0.001_HIGHER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/11_blast/RvsJ_Pvalue0.001_HIGHER_blast_output.txt
OUT_FILE_RvsJ_Pvalue0.001_MODIFIER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/11_blast/RvsJ_Pvalue0.001_MODIFIER_blast_output.txt
OUT_FILE_VvsJ_Pvalue0.001_HIGHER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/11_blast/VvsJ_Pvalue0.001_HIGHER_blast_output.txt
OUT_FILE_VvsJ_Pvalue0.001_MODIFIER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/11_blast/VvsJ_Pvalue0.001_MODIFIER_blast_output.txt
OUT_FILE_VvsR_Pvalue0.001_HIGHER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/11_blast/VvsR_Pvalue0.001_HIGHER_blast_output.txt
OUT_FILE_VvsR_Pvalue0.001_MODIFIER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/11_blast/VvsR_Pvalue0.001_MODIFIER_blast_output.txt

QUERY_RvsJ_Pvalue0.01_HIGHER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/RvsJ_Pvalue0.01_HIGHER.txt
QUERY_RvsJ_Pvalue0.01_MODIFIER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/RvsJ_Pvalue0.01_MODIFIER.txt
QUERY_VvsJ_Pvalue0.01_HIGHER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/VvsJ_Pvalue0.01_HIGHER.txt
QUERY_VvsJ_Pvalue0.01_MODIFIER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/VvsJ_Pvalue0.01_MODIFIER.txt
QUERY_VvsR_Pvalue0.01_HIGHER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/VvsR_Pvalue0.01_HIGHER.txt
QUERY_VvsR_Pvalue0.01_MODIFIER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/VvsR_Pvalue0.01_MODIFIER.txt
OUT_FILE_RvsJ_Pvalue0.01_HIGHER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/11_blast/RvsJ_Pvalue0.01_HIGHER_blast_output.txt
OUT_FILE_RvsJ_Pvalue0.01_MODIFIER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/11_blast/RvsJ_Pvalue0.01_MODIFIER_blast_output.txt
OUT_FILE_VvsJ_Pvalue0.01_HIGHER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/11_blast/VvsJ_Pvalue0.01_HIGHER_blast_output.txt
OUT_FILE_VvsJ_Pvalue0.01_MODIFIER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/11_blast/VvsJ_Pvalue0.01_MODIFIER_blast_output.txt
OUT_FILE_VvsR_Pvalue0.01_HIGHER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/11_blast/VvsR_Pvalue0.01_HIGHER_blast_output.txt
OUT_FILE_VvsR_Pvalue0.01_MODIFIER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/11_blast/VvsR_Pvalue0.01_MODIFIER_blast_output.txt





BANK=/home/ref-bioinfo/beedeem/p/NCBI_nr/current/NCBI_nr/NCBI_nr
BLAST_PROGRAM=blastx
ALIGNMENTS=3
BLAST_PARAM="-evalue 1e-3"
CB_NAME=$(basename $PBS_JOBNAME)
CB_TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
CB_LOG_FOLDER=$DATAWORK/"$CB_TIMESTAMP"_"$CB_NAME"
mkdir -p $CB_LOG_FOLDER
cp $0 $CB_LOG_FOLDER/$CB_NAME

# Activation de l'environnement BLAST+ 2.6.0
. /appli/bioinfo/blast/2.6.0/env.sh

# Lancement de BLAST
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive.asn1
${BLAST_PROGRAM} -query "${QUERY_RvsJ_Pvalue0.001_HIGHER}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE_RvsJ_Pvalue0.001_HIGHER} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"

# Lancement de BLAST
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive.asn1
${BLAST_PROGRAM} -query "${QUERY_RvsJ_Pvalue0.001_MODIFIER}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE_RvsJ_Pvalue0.001_MODIFIER} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"







# Lancement de BLAST
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive.asn1
${BLAST_PROGRAM} -query "${QUERY_VvsJ_Pvalue0.001_HIGHER}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE_VvsJ_Pvalue0.001_HIGHER} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"

# Lancement de BLAST
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive.asn1
${BLAST_PROGRAM} -query "${QUERY_VvsJ_Pvalue0.001_MODIFIER}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE_VvsJ_Pvalue0.001_MODIFIER} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"







# Lancement de BLAST
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive.asn1
${BLAST_PROGRAM} -query "${QUERY_VvsR_Pvalue0.001_HIGHER}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE_VvsR_Pvalue0.001_HIGHER} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"

# Lancement de BLAST
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive.asn1
${BLAST_PROGRAM} -query "${QUERY_VvsR_Pvalue0.001_MODIFIER}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE_VvsR_Pvalue0.001_MODIFIER} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"





# Lancement de BLAST
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive.asn1
${BLAST_PROGRAM} -query "${QUERY_RvsJ_Pvalue0.01_HIGHER}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE_RvsJ_Pvalue0.01_HIGHER} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"

# Lancement de BLAST
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive.asn1
${BLAST_PROGRAM} -query "${QUERY_RvsJ_Pvalue0.01_MODIFIER}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE_RvsJ_Pvalue0.01_MODIFIER} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"







# Lancement de BLAST
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive.asn1
${BLAST_PROGRAM} -query "${QUERY_VvsJ_Pvalue0.01_HIGHER}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE_VvsJ_Pvalue0.01_HIGHER} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"

# Lancement de BLAST
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive.asn1
${BLAST_PROGRAM} -query "${QUERY_VvsJ_Pvalue0.01_MODIFIER}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE_VvsJ_Pvalue0.01_MODIFIER} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"







# Lancement de BLAST
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive.asn1
${BLAST_PROGRAM} -query "${QUERY_VvsR_Pvalue0.01_HIGHER}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE_VvsR_Pvalue0.01_HIGHER} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"

# Lancement de BLAST
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive.asn1
${BLAST_PROGRAM} -query "${QUERY_VvsR_Pvalue0.01_MODIFIER}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE_VvsR_Pvalue0.01_MODIFIER} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"
