#!/usr/bin/env bash
#PBS -q omp
#PBS -l ncpus=12
#PBS -l mem=100g
#PBS -l walltime=96:00:00

# FreeBayes is a Bayesian genetic variant detector designed to find small polymorphisms, specifically SNPs (single-nucleotide polymorphisms), 
# indels (insertions and deletions), MNPs (multi-nucleotide polymorphisms), and complex events (composite insertion and substitution events) 
# smaller than the length of a short-read sequencing alignment.

# For pool datas:
# --pooled-discrete
# and
# create a cnv.bed
# multiple ploidy (here 2) by the nb of individuals

# dans cnv-map.bed
# mettre

FB_ENV=/home1/datawork/plstenge/96_env_conda/freebayes # path to conda freebayes env if needed Version 1.2.0
REF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta # path to ref genome
BAM=/home1/scratch/plstenge/freebayes		#path to txt file containing list of filtered bam files (resulting from step 03)
NB_CPU=12
nAlleles=4
# minMapQ=20
# minCOV=5
# VCF=/home/datawork-rmpf/p_margaritifera/pl-pwgs/05_variant_call_freebayes		#path to output vcf file
# LOG=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/12_freebayes.out		#path to log file

cd ${BAM}
${FB_ENV}

#freebayes -f ${REF} \
#	--use-best-n-alleles $nAlleles \
#        --min-mapping-quality $minMapQ \
#	--pooled-discrete \
#        --min-coverage $minCOV \
#	--cnv-map sspace.final.scaffolds_Pool1_Pool2.bed \
#	pool1.bam pool2.bam \
#	--vcf ${VCF} >& $LOG
	
freebayes -f ${REF} --use-best-n-alleles $nAlleles --pooled-discrete --cnv-map sspace.final.scaffolds_Pool1_Pool2.bed --ploidy 2 pool1.bam pool2.bam | vcffilter -f "QUAL > 20" > pools1_2.vcf
