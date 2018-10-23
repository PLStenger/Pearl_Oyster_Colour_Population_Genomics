#!/bin/bash
#PBS -v DOCKER_IMAGE=“docker.ifremer.fr/bioinfo/popoolation2:1201”
#PBS -q omp
#PBS -l walltime=96:00:00
#PBS -l mem=80g
#PBS -l ncpus=20


BAM=/home1/scratch/plstenge/freebayes	
SAMTOOLS="samtools"
SAM_ENV=". /appli/bioinfo/samtools/latest/env.sh"

cd $BAM
$SAM_ENV
$SAMTOOLS mpileup -B HI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted_MD_sorted_split_RG.bam HI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted_MD_sorted_split_RG.bam HI.4499.008.NS_Adaptor_14.pool6GV_filtered_sorted_MD_sorted_split_RG.bam HI.4506.001.NS_Adaptor_13.pool5GJ_filtered_sorted_MD_sorted_split_RG.bam HI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted_MD_sorted_split_RG.bam HI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted_MD_sorted_split_RG.bam HI.4506.004.NS_Adaptor_10.pool2TJ_filtered_sorted_MD_sorted_split_RG.bam HI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted_MD_sorted_split_RG.bam HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD_sorted_split_RG.bam HI.4527.005.NS_Adaptor_19.pool11EJ_filtered_sorted_MD_sorted_split_RG.bam HI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted_MD_sorted_split_RG.bam HI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted_MD_sorted_split_RG.bam > all_12_bam.mpileup


$POPOO_HOME
java -ea -Xmx7g -jar <popoolation2-path>/mpileup2sync.jar --input all_12_bam.mpileup --output all_12_bam_mpileup_java.sync --fastq-type sanger --min-qual 20 --threads 8
