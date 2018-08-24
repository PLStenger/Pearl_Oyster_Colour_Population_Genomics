#!/bin/bash

#Global variables
ASSEMBLY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta
INPUT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/03_trimmed/index.txt
WORKING_DIRECTORY=/home1/scratch/plstenge/BWA
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
HEADER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/header.txt
BWA="bwa"			
BWA_ENV=". /appli/bioinfo/bwa/latest/env.sh"
INDEX=1		# Lancer avec 0 une premiere fois le script pour créer l'index du génome, puis après mettre 1 et le relancer	
NB_CPU=16	#number of cpus

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
for i in {1..2}
do
	R1=LEFT_$i ;
	R2=RIGHT_$i ;
	temp=${!R1##*/} ;
	prefix=${temp%%_R1*} ;
	cp ${HEADER} ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
	echo "${BWA_ENV}" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
	echo "time ${BWA} mem -t ${NB_CPU} -M ${ASSEMBLY} ${!R1} ${!R2} > ${WORKING_DIRECTORY}/${TAG}/${prefix}.sam" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
	echo "samtools view -b  ${WORKING_DIRECTORY}/${TAG}/${prefix}.sam  >  ${WORKING_DIRECTORY}/${TAG}/${prefix}.sam.bam"
	echo "rm -r ${WORKING_DIRECTORY}/${TAG}/${prefix}.sam"
	qsub ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
done

fi
