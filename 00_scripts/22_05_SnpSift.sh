#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATADIRECTORY=/home/datawork-rmpf/p_margaritifera/pl-pwgs/07_snpeff
#SNPEFFENV=". /appli/bioinfo/snpeff/latest/env.sh"

# il faut d'abord mettre sur le fichier config la configuration du génome


SNPEFF=/home/datawork-rmpf/p_margaritifera/pl-pwgs/98_programms/SNPeff/snpEff #/Path/to/snpEff/Folder

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate /home/datawork-rmpf/p_margaritifera/pl-pwgs/98_programms/SNPeff/

DBNAME=sspace.final.scaffolds.fasta

WORKDIR=/home/datawork-rmpf/p_margaritifera/pl-pwgs/07_snpeff


java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_RedVsGreen_dat_P_0_000000001_SNPEff.vcf_SnpSift.txt

java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsGreen_dat_P_0_000000001_SNPEff.vcf_SnpSift.txt

java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header_YellowVsRed_dat_P_0_000000001_SNPEff.vcf_SnpSift.txt

### OLD SCRIPT:

##!/usr/bin/env bash
##PBS -q mpi
##PBS -l walltime=48:00:00
##PBS -l select=1:ncpus=28:mem=115g
#
#DATADIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm
#SNPEFFENV=". /appli/bioinfo/snpeff/latest/env.sh"
#
## il faut d'abord mettre sur le fichier config la configuration du génome
#
#
#SNPEFF=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/95_software/snpEff #/Path/to/snpEff/Folder
#DBNAME=sspace.final.scaffolds.fasta
#WORKDIR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/09_snpEff_glm
#
#
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/TakapotoVsGambier_OK_dat_P_0_001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/TakapotoVsGambier_OK_dat_P_0_001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/HatcheryVsGambier_OK_dat_P_0_000001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/HatcheryVsGambier_OK_dat_P_0_000001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/TakapotoVsGambier_OK_dat_P_0_01_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/TakapotoVsGambier_OK_dat_P_0_01_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/HatcheryVsGambier_OK_dat_P_0_001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/HatcheryVsGambier_OK_dat_P_0_001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/TakapotoVsHatchery_OK_dat_P_0_000001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/TakapotoVsHatchery_OK_dat_P_0_000001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/HatcheryVsGambier_OK_dat_P_0_01_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/HatcheryVsGambier_OK_dat_P_0_01_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/TakapotoVsHatchery_OK_dat_P_0_001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/TakapotoVsHatchery_OK_dat_P_0_001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/KatiuVsGambier_OK_dat_P_0_000001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/KatiuVsGambier_OK_dat_P_0_000001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/TakapotoVsHatchery_OK_dat_P_0_01_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/TakapotoVsHatchery_OK_dat_P_0_01_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/KatiuVsGambier_OK_dat_P_0_001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/KatiuVsGambier_OK_dat_P_0_001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/TakapotoVsKatiu_OK_dat_P_0_000001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/TakapotoVsKatiu_OK_dat_P_0_000001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/KatiuVsGambier_OK_dat_P_0_01_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/KatiuVsGambier_OK_dat_P_0_01_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/TakapotoVsKatiu_OK_dat_P_0_001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/TakapotoVsKatiu_OK_dat_P_0_001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/KatiuVsHatchery_OK_dat_P_0_000001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/KatiuVsHatchery_OK_dat_P_0_000001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/TakapotoVsKatiu_OK_dat_P_0_01_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/TakapotoVsKatiu_OK_dat_P_0_01_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/KatiuVsHatchery_OK_dat_P_0_001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/KatiuVsHatchery_OK_dat_P_0_001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/YellowVsGreen_OK_dat_P_0_000001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/YellowVsGreen_OK_dat_P_0_000001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/KatiuVsHatchery_OK_dat_P_0_01_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/KatiuVsHatchery_OK_dat_P_0_01_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/YellowVsGreen_OK_dat_P_0_001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/YellowVsGreen_OK_dat_P_0_001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/RedVsGreen_OK_dat_P_0_000001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/RedVsGreen_OK_dat_P_0_000001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/YellowVsGreen_OK_dat_P_0_01_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/YellowVsGreen_OK_dat_P_0_01_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/RedVsGreen_OK_dat_P_0_001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/RedVsGreen_OK_dat_P_0_001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/YellowVsRed_OK_dat_P_0_000001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/YellowVsRed_OK_dat_P_0_000001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/RedVsGreen_OK_dat_P_0_01_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/RedVsGreen_OK_dat_P_0_01_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/YellowVsRed_OK_dat_P_0_001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/YellowVsRed_OK_dat_P_0_001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/TakapotoVsGambier_OK_dat_P_0_000001_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/TakapotoVsGambier_OK_dat_P_0_000001_SNPEff_SnpSift.txt
#java -jar $SNPEFF/SnpSift.jar extractFields $DATADIRECTORY/YellowVsRed_OK_dat_P_0_01_SNPEff.vcf CHROM POS REF ALT "ANN[0].EFFECT" "ANN[*].HGVS" > $DATADIRECTORY/YellowVsRed_OK_dat_P_0_01_SNPEff_SnpSift.txt




