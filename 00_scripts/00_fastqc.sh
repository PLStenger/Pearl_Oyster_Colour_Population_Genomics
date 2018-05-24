#!/bin/bash

DATADIRECTORY=/home/ref-bioinfo/ifremer/rmpf/Pmarg_color_WGS_2018/data/dna-sequence-raw
DATAOUTPUT=/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_fastqc
SCRIPT=/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/00_fastqc
HEADER=/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/header.txt
FASTQCENV=". /appli/bioinfo/fastqc/latest/env.sh"

mkdir -p $SCRIPT

for FILE in $(ls $DATADIRECTORY/*.fastq.gz)
do
        cp $HEADER $SCRIPT/fastqc_${FILE##*/}.qsub ;
        echo "cd $DATADIRECTORY" >> $SCRIPT/fastqc_${FILE##*/}.qsub ;
        echo "$FASTQCENV"  >> $SCRIPT/fastqc_${FILE##*/}.qsub ;
        echo "fastqc $FILE -o $DATAOUTPUT" >> $SCRIPT/fastqc_${FILE##*/}.qsub ;
        qsub $SCRIPT/fastqc_${FILE##*/}.qsub ;
done ;
