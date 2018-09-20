#!/usr/bin/env bash
#PBS -q sequentiel
#PBS -l ncpus=1
#PBS -l mem=60g
#PBS -l walltime=12:00:00

FB_ENV=/home1/datawork/plstenge/96_env_conda/freebayes # path to conda freebayes env if needed
# FB=		#path to freebayes version v1.1.0-3-g961e5f3
REF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta # path to ref genome
BAM=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/variants.txt		#path to txt file containing list of filtered bam files (resulting from step 03)
NB_CPU=12
nAlleles=4
minMapQ=20
minCOV=5
VCF=/home/datawork-rmpf/p_margaritifera/pl-pwgs/05_variant_call_freebayes		#path to output vcf file
LOG=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/12_freebayes.out		#path to log file

${FB_ENV}

freebayes -f ${REF} \
	--use-best-n-alleles $nAlleles \
        --min-mapping-quality $minMapQ \
        --min-coverage $minCOV \
	--bam-list ${BAM} \
	--vcf ${VCF} >& $LOG
