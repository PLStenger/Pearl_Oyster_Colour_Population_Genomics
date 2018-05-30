cd /home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/
cp /appli/bioinfo/blast/latest/blast.pbs .

QUERY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/97_tests/GreenGEDBlastX.fasta
BANK=/home/ref-bioinfo/beedeem/p/NCBI_nr/current/NCBI_nr/NCBI_nrM
BLAST_PROGRAM=blastp
BLAST_FORMAT=0
OUT_FILE=greenBlastX.txt
ALIGNMENTS=25
BLAST_PARAM="-evalue 1e-3"
