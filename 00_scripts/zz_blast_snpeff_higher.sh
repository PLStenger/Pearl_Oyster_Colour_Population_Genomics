#!/usr/bin/env bash
#PBS -q mpi
#PBS -l select=1:ncpus=28:mpiprocs=28:mem=60gb
#PBS -l walltime=48:00:00

BLAST_PROGRAM=blastx
ALIGNMENTS=3
BLAST_PARAM="-evalue 1e-3"
BANK=/home/ref-bioinfo/beedeem/p/NCBI_nr/current/NCBI_nr/NCBI_nr

QUERY1=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/HatcheryVsGambier_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
OUT_FILE1=HatcheryVsGambier_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
QUERY2=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/KatiuVsGambier_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
OUT_FILE2=KatiuVsGambier_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
QUERY3=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/KatiuVsHatchery_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
OUT_FILE3=KatiuVsHatchery_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
QUERY4=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/RedVsGreen_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
OUT_FILE4=RedVsGreen_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
QUERY5=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/TakapotoVsGambier_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
OUT_FILE5=TakapotoVsGambier_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
QUERY6=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/TakapotoVsHatchery_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
OUT_FILE6=TakapotoVsHatchery_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
QUERY7=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/TakapotoVsKatiu_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
OUT_FILE7=TakapotoVsKatiu_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
QUERY8=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/YellowVsGreen_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
OUT_FILE8=YellowVsGreen_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
QUERY9=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/YellowVsRed_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta
OUT_FILE9=YellowVsRed_OK_dat_P_0_000001_genes_summary.txt_higher_fasta.fasta

# Activation de l'environnement BLAST+ 2.6.0
. /appli/bioinfo/blast/2.6.0/env.sh

# ------------------------------------------------------------------------------

CB_NAME=$(basename $PBS_JOBNAME)
CB_TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
CB_LOG_FOLDER=$DATAWORK/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/11_blast_with_iteration/"$CB_TIMESTAMP"_"$CB_NAME"
mkdir -p $CB_LOG_FOLDER
cp $0 $CB_LOG_FOLDER/$CB_NAME


# Lancement de BLAST
#  note: nous produisons le fichier 'archive blast' (-outfmt 11) ...
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive1.asn1
${BLAST_PROGRAM} -query "${QUERY1}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE1} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"

# Lancement de BLAST
#  note: nous produisons le fichier 'archive blast' (-outfmt 11) ...
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive2.asn1
${BLAST_PROGRAM} -query "${QUERY2}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE2} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"

# Lancement de BLAST
#  note: nous produisons le fichier 'archive blast' (-outfmt 11) ...
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive3.asn1
${BLAST_PROGRAM} -query "${QUERY3}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE3} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"

# Lancement de BLAST
#  note: nous produisons le fichier 'archive blast' (-outfmt 11) ...
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive4.asn1
${BLAST_PROGRAM} -query "${QUERY4}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE4} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"

# Lancement de BLAST
#  note: nous produisons le fichier 'archive blast' (-outfmt 11) ...
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive5.asn1
${BLAST_PROGRAM} -query "${QUERY5}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE5} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"

# Lancement de BLAST
#  note: nous produisons le fichier 'archive blast' (-outfmt 11) ...
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive6.asn1
${BLAST_PROGRAM} -query "${QUERY6}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE6} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"

# Lancement de BLAST
#  note: nous produisons le fichier 'archive blast' (-outfmt 11) ...
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive7.asn1
${BLAST_PROGRAM} -query "${QUERY7}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE7} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"

# Lancement de BLAST
#  note: nous produisons le fichier 'archive blast' (-outfmt 11) ...
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive8.asn1
${BLAST_PROGRAM} -query "${QUERY8}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE8} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"

# Lancement de BLAST
#  note: nous produisons le fichier 'archive blast' (-outfmt 11) ...
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive9.asn1
${BLAST_PROGRAM} -query "${QUERY9}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE9} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"


