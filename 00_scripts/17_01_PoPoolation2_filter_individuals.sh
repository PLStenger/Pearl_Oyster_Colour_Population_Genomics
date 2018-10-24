#!/bin/bash
#PBS -q omp
#PBS -l walltime=48:00:00
#PBS -l mem=70g
#PBS -l ncpus=10


BAM=/home1/scratch/plstenge/freebayes	
BCFLIBENV=". /appli/bioinfo/bcftools/1.4.1/env.sh"

cd $BAM
$BCFLIBENV

bcftools view -bvcg all_12_bam.mpileup > all_12_bam.mpileup_var.raw.bcf
bcftools filter all_12_bam.mpileup_var.raw.bcf -i TYPE="snp" FORMAT/DP[*] > 20 -o all_12_bam.mpileup_var.filtered.bcf


# view = subset
# -b pour passer mpileup à bcf ?
