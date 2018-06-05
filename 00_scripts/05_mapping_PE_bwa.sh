#!/bin/bash

#Global variables
ASSEMBLY=			/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/Pmarg_platanus_v1_trimmed.fasta
INPUT=				/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/03_trimmed/
WORKING_DIRECTORY=		/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/05_mapping_PE_bwa
SCRIPT=				/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/05_mapping_PE_bwa.sh
HEADER=				/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/header.txt
BWA="bwa"			
BWA_ENV=			". /appli/bioinfo/bwa/lastest/env.sh"
INDEX=1				#boolean : 1 if transcriptome/genome index exists, else 0	
NB_CPU=16			#number of cpus

TAG="mapping_BWA_${ASSEMBLY##*/}"

#Source trimmed fastq list file
source ${INPUT}

#Creatind index if not existing
if [[ $INDEX == 0 ]]
then
	cp ${HEADER} ${SCRIPT}/create_bwa_index_${ASSEMBLY##*/}.qsub ;
	echo "${BWA_ENV}" >> ${SCRIPT}/create_bwa_index_${ASSEMBLY##*/}.qsub ;
	echo "time ${BWA} index $ASSEMBLY" >> ${SCRIPT}/create_bwa_index_${ASSEMBLY##*/}.qsub ;
	qsub ${SCRIPT}/create_bwa_index_${ASSEMBLY##*/}.qsub ;
else


#Running bwa
mkdir -p $WORKING_DIRECTORY/$TAG

cd $WORKING_DIRECTORY/$TAG

#BWA
for i in {1..24}
do
	R1=LEFT_$i ;
	R2=RIGHT_$i ;
	temp=${!R1##*/} ;
	prefix=${temp%%_R1*} ;
	cp ${HEADER} ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
	echo "${BWA_ENV}" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
	echo "time ${BWA} mem -t ${NB_CPU} -M ${ASSEMBLY} ${!R1} ${!R2} > ${WORKING_DIRECTORY}/${TAG}/${prefix}.bam" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
	qsub ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
done

fi
