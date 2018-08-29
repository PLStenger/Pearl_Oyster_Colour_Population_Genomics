#!/usr/bin/env bash
#PBS -o flagstat.out
#PBS -q omp
#PBS -l ncpus=16
#PBS -l mem=60gb
#PBS -l walltime=96:00:00


#Global variables
INPUT=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
SAMTOOLS="samtools"
SAM_ENV=". /appli/bioinfo/samtools/latest/env.sh"
NB_CPU=16	#number of cpus



$SAM_ENV
cd $INPUT

$SAMTOOLS flagstat HI.4506.003.NS_Adaptor_11.pool3TV.bam > HI.4506.003.NS_Adaptor_11.pool3TV_flagstat.txt
$SAMTOOLS flagstat HI.4527.004.NS_Adaptor_20.pool12EV.bam > HI.4527.004.NS_Adaptor_20.pool12EV_flagstat.txt
$SAMTOOLS flagstat HI.4527.007.NS_Adaptor_17.pool9KV.bam > HI.4527.007.NS_Adaptor_17.pool9KV_flagstat.txt
