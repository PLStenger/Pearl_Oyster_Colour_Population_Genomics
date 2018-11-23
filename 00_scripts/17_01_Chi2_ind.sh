#!/bin/bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g


WORKING_DIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_vcf_files
PYTHON_SCRIPT=get_AF_from_vcf_v4.py
VCF_FILE=individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf
BASENAME_VCF=${ORIGINAL_VCF_FILE##*/}
FINAL_OUTPUT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/08_chi2/${BASENAME_VCF}._chi2
LOG=${WORKING_DIRECTORY}/python.log

#Load conda env
export PATH=$PATH:/appli/anaconda/2.7/bin

source activate python_env

cd ${WORKING_DIRECTORY} 

python ${PYTHON_SCRIPT} ${VCF_FILE} -t 16 -o ${FINAL_OUTPUT} >& ${LOG} 2>&1
