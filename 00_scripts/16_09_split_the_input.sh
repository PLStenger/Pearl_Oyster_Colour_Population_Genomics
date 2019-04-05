#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g

# Now I split the file individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt from 16_08_deleted_header_singleID.sh
# In order to do the statistical test on different part of the file to gain time.

INDIR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $INDIR

split -l 2400000 individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt
    i=1
    for x in `ls x* | sort`
    do
        mv $x individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL_split_$i.txt
        i=$(($i+1))
    done
