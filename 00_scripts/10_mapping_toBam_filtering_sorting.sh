#!/bin/bash

#Global variables
ASSEMBLY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta
INPUT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/03_trimmed/index3.txt
WORKING_DIRECTORY1=/home1/scratch/plstenge/BWA
WORKING_DIRECTORY2=/home1/scratch/plstenge/BWA/mapping_BWA_sspace.final.scaffolds.fasta
WORKING_DIRECTORY3=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
HEADER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/header.txt
BWA="bwa"			
BWA_ENV=". /appli/bioinfo/bwa/latest/env.sh"
SAMTOOLS="samtools"
SAM_ENV=". /appli/bioinfo/samtools/latest/env.sh"
INDEX=1		# Lancer avec 0 une premiere fois le script pour créer l'index du génome, puis après mettre 1 et le relancer	
NB_CPU=16	#number of cpus

# Explanations
# Wrote one script for one individual
# ">> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;" = put it in the script

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
mkdir -p $WORKING_DIRECTORY1/$TAG

cd $WORKING_DIRECTORY1/$TAG

# BWA
for i in {1..8}
do
	R1=LEFT_$i ;
	R2=RIGHT_$i ;
	temp=${!R1##*/} ;
	prefix=${temp%%_R1*} ;
	
  cp ${HEADER} ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  
  echo "# Mapping BWA" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ; 
  echo "${BWA_ENV}" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  echo "time ${BWA} mem -t ${NB_CPU} -M ${ASSEMBLY} ${!R1} ${!R2} > ${WORKING_DIRECTORY1}/${TAG}/${prefix}.sam" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  
  echo "# Sam To Bam" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ; 
  echo "$SAM_ENV" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  echo "$SAMTOOLS view -b  ${WORKING_DIRECTORY1}/${TAG}/${prefix}.sam  >  ${WORKING_DIRECTORY1}/${TAG}/${prefix}.bam" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
	
  echo "# Delete Sam file" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ; 
  echo "rm -r ${WORKING_DIRECTORY1}/${TAG}/${prefix}.sam" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  
  echo "# Copy bam file from scratch to datawork_rmpf" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  echo "cp ${WORKING_DIRECTORY1}/${TAG}/${prefix}.bam $WORKING_DIRECTORY3" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  
  echo "# Flagstat" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  echo "cd $WORKING_DIRECTORY3" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  echo "$SAMTOOLS flagstat ${WORKING_DIRECTORY3}/${prefix}.bam > ${WORKING_DIRECTORY3}/${prefix}_flagstat_bam.txt" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  
  echo "# Filtering" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  echo "cd $WORKING_DIRECTORY3" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  echo "$SAMTOOLS view -F 4 -F 256 -q 5 -f2 -b ${WORKING_DIRECTORY3}/${prefix}.bam > ${WORKING_DIRECTORY3}/${prefix}_filtered.bam" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  
  echo "# Flagstat for filtered files" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  echo "cd $WORKING_DIRECTORY3" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  echo "$SAMTOOLS flagstat ${WORKING_DIRECTORY3}/${prefix}_filtered.bam > ${WORKING_DIRECTORY3}/${prefix}_filtered_flagstat.txt" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;  
  
  echo "# Sorting" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  echo "cd $WORKING_DIRECTORY3" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  echo "$SAMTOOLS view sort ${WORKING_DIRECTORY3}/${prefix}_filtered.bam > ${WORKING_DIRECTORY3}/${prefix}_filtered_sorted.bam" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
 
  echo "# Flagstat for sort files" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  echo "cd $WORKING_DIRECTORY3" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
  echo "$SAMTOOLS flagstat ${WORKING_DIRECTORY3}/${prefix}_filtered.bam > ${WORKING_DIRECTORY3}/${prefix}_filtered_sorted_flagstat.txt" >> ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;  

# qsub ${SCRIPT}/remapping_BWA_${ASSEMBLY##*/}_${prefix}.qsub ;
done

fi



