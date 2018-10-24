#!/usr/bin/env bash
#PBS -v DOCKER_IMAGE=“docker.ifremer.fr/bioinfo/popoolation2:1201”
#PBS -q omp
#PBS -l ncpus=8
#PBS -l mem=8g
#PBS -l walltime=48:00:00

BAM=/home1/scratch/plstenge/freebayes	

cd $BAM

$POPOO_HOME
java -ea -Xmx7g -jar <popoolation2-path>/mpileup2sync.jar --input all_12_bam.mpileup --output all_12_bam_mpileup_java.sync --fastq-type sanger --min-qual 20 --threads 8
