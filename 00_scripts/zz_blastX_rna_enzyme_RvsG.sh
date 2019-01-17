#!/usr/bin/env bash
#PBS -q mpi
#PBS -l select=1:ncpus=28:mpiprocs=28:mem=60gb
#PBS -l walltime=48:00:00

#
# Documentation a lire :
# 
#   https://w3z.ifremer.fr/bioinfo/Cmdline-Datarmor/BLAST-en-ligne-de-commande
#

# La query a utiliser: VOTRE fichier Fasta
QUERY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/enzyme_RvsG.fasta

# La banque de reference a utiliser
# Comment trouver une banque ? 
# cf. https://w3z.ifremer.fr/bioinfo/Cmdline-Datarmor/BLAST-en-ligne-de-commande
#     section "Lister les banques disponibles" 
BANK=/home/ref-bioinfo/beedeem/p/NCBI_nr/current/NCBI_nr/NCBI_nr

# Quel program BLAST faut-il lancer: blastp, blastn, blastx, tblastn, tblastx ?
# Attention: 'blastn' lancera 'megablast'. Pour forcer l'utilisation de 'blastn',
#            utilisez: "blastn -task blastn"
BLAST_PROGRAM=blastx

# Format du fichier de resultat BLAST
#  0:Pairwise ; 5:XML ; 6: tabular ; 
#  plus de formats: https://www.ncbi.nlm.nih.gov/books/NBK279684/ : Table C1
# BLAST_FORMAT=6 qseqid sseqid sallseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore

# Votre fichier de resultat
# Attention: uniquement un nom de fichier. Celui-ci sera place dans un dossier 
#            unique sur votre dossier $DATAWORK, et plus precisement dans 
#            un sous-dossier date de ce type la :
#            $DATAWORK/2018-01-30_15h10m54s_blast.pbs/ 
OUT_FILE=enzyme_RvsG_Blast.txt

# nombre de best hits (alignements) a rapporter dans le resultat
ALIGNMENTS=3

# Parametres de recherche additionnels.
#
#   Dans cet exemple, nous fixons le seuil de e-value a 10-3 ; adaptez si necessaire.
#
# Les parametres de BLAST sont décrits ici : 
#   https://www.ncbi.nlm.nih.gov/books/NBK279684/
#
# ATTENTION: 
#   *NE PAS* utiliser les directives suivantes :  
#    -num_descriptions
#    -num_alignments 
#    -max_target_seqs
#   car ce script gere pour vous le nb de bests a produire dans le resultat
#   (cf variable 'ALIGNMENTS' ci-dessus'
BLAST_PARAM="-evalue 1e-3"


# ------------------------------------------------------------------------------
# Evitez de modifier la suite, sauf si vous savez ce que vous allez faire !!!

# Creation d'un dossier unique pour votre job BLAST
CB_NAME=$(basename $PBS_JOBNAME)
CB_TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
CB_LOG_FOLDER=$DATAWORK/"$CB_TIMESTAMP"_"$CB_NAME"
mkdir -p $CB_LOG_FOLDER
cp $0 $CB_LOG_FOLDER/$CB_NAME

# Activation de l'environnement BLAST+ 2.6.0
. /appli/bioinfo/blast/2.6.0/env.sh

# Lancement de BLAST
#  note: nous produisons le fichier 'archive blast' (-outfmt 11) ...
BLAST_ARCHIVE=${CB_LOG_FOLDER}/results-archive.asn1
${BLAST_PROGRAM} -query "${QUERY}" -db "${BANK}" -out ${BLAST_ARCHIVE} -outfmt 11 -max_target_seqs $ALIGNMENTS ${BLAST_PARAM} -num_threads $NCPUS
# -max_target_seqs is here intentional in order to limit the number of lines. This is here just for a "shot gun" in order to see brievly the datas before re-run with good parameters.
#  ... comme cela nous pouvons reformatter le resultat a loisirs, sans relancer le blast
# blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE} -outfmt ${BLAST_FORMAT}
blast_formatter -archive ${BLAST_ARCHIVE} -out ${CB_LOG_FOLDER}/${OUT_FILE} -outfmt "6 stitle qseqid sacc pident length mismatch gapopen qstart qend sstart send evalue bitscore"
