#!/bin/bash

# Header
DATADIRECTORY=/home/ref-bioinfo/ifremer/rmpf/Pmarg_color_WGS_2018/data/dna-sequence-raw
DATARMORJOB=/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/datarmor_jobs
SCRIPTFOLDER=/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts

# Clean up
rm $DATARMORJOB/TRIM*sh

# launch scripts for Colosse
for file in $(ls $DATADIRECTORY/*_R1.fastq.gz|perl -pe 's/.f(ast)?q.gz//'|sort -u)

do
	# base=$(basename "$file")
	tmp=${file%_R1.fastq.gz*}
	base=${tmp##*/}
	echo $base
	#toEval="cat $SCRIPTFOLDER/02_trimmomatic_qs28.qsub | sed 's/__BASE__/$base/g'"; eval $toEval > $DATARMORJOB/TRIM_"$base".sh
done


#change jobs header

#Submit jobs
for i in $(ls $DATARMORJOB/TRIM*sh); do qsub $i; done
