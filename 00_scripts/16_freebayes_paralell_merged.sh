#!/bin/bash
#PBS -q omp
#PBS -l walltime=180:00:00
#PBS -l mem=800g
#PBS -l ncpus=12

REF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta # path to ref genome
INDEX=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta.fai # path to ref genome index
BAM=/home1/scratch/plstenge/merged_bam		
nAlleles=4
NCPU=12

cd ${BAM}
export PATH=$PATH:/appli/anaconda/2.7/bin
source activate /home1/datawork/plstenge/96_env_conda/freebayes

freebayes-parallel      <(fasta_generate_regions.py $INDEX 10000) "$NCPU" \
-f $REF --use-best-n-alleles $nAlleles --pooled-discrete --cnv-map cnv_for_merged_bam.bed \
-b $BAM/yellow.bam $BAM/red.bam $BAM/green.bam > merged_bam_ryg_genotypes_paralell.vcf
