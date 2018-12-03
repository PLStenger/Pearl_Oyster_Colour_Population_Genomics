#!/usr/bin/env bash
#PBS -q omp
#PBS -l walltime=48:00:00
#PBS -l ncpus=28
#PBS -l mem=115g

WORKING_DIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_vcf_files
PYTHON_SCRIPT=17_01_Chi2_ind.py
VCF_FILE=individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf
BASENAME_VCF=${ORIGINAL_VCF_FILE##*/}
FINAL_OUTPUT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_chi2/${BASENAME_VCF}._chi2
LOG=${WORKING_DIRECTORY}/python.log

#Load conda env
export PATH=$PATH:/appli/anaconda/2.7/bin

source activate $DATAWORK/python

cd ${WORKING_DIRECTORY} 

python ${PYTHON_SCRIPT} ${VCF_FILE} -t 28 -o ${FINAL_OUTPUT} >& ${LOG} 2>&1
