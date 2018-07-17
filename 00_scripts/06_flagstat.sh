#!/usr/bin/env bash
#PBS -o flagstat.out
#PBS -q omp
#PBS -l ncpus=8
#PBS -l mem=60gb
#PBS -l walltime=96:00:00
#PBS -r n

# Header
DATADIRECTORY=/home1/scratch/plstenge/testBWA/mapping_BWA_sspace.final.scaffolds.fasta
DATAOUTPUT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/06_flagstat
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/06_flagstat
HEADER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/header.txt
FLAGSTATENV=". /appli/bioinfo/samtools/latest/env.sh"


for FILE in $(ls $DATADIRECTORY/*.bam)
do
        cp $HEADER $SCRIPT/flagstat_${FILE##*/}.qsub ;
        echo "cd $DATADIRECTORY" >> $SCRIPT/flagstat_${FILE##*/}.qsub ;
        echo "$FLAGSTATENV"  >> $SCRIPT/flagstat_${FILE##*/}.qsub ;
        echo "samtools view $FILE | cut -f1 | sort | uniq | wc -l >> $DATAOUTPUT">> $SCRIPT/flagstat_${FILE##*/}.qsub ;
        
done ;

#qsub $SCRIPT/flagstat_${FILE##*/}.qsub ;
