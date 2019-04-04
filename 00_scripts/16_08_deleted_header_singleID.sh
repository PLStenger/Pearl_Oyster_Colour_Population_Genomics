#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g


# Ce script permet de pouvoir modifier et formater le VCF pour les analyses statistiques suivantes, notament d'enlever le header et d'obtenir un noms de SNP unique en fusion le nom du scaffold avec la position


INDIR=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd $INDIR

# - = input de l'étape précédente'

# Enlever le header (comprenant les "#")

#grep -v "^#" $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex.vcf >& $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header.vcf
grep -v "^#" $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex.vcf > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header.vcf


# Et pour stocker le header dans un autre fichier:

#grep "^#" $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex.vcf >& $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf
grep "^#" $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex.vcf > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_header.vcf




# In order to deal with some problems after Freebayes (less columns than usually / fusion of cells) and create a unique SNP name ("Scaffold name" + position)
awk '{$9=$10=$11=$12=$13=$14=$15=$16=$17=$18=$19=$20=$21=""; print $1"_"$2"\t"$0}' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header.txt > $INDIR/OK.txt
awk '{gsub("GT:DP:AD:RO:QR:AO:QA:GL", "", $0); print $0}' $INDIR/OK.txt > $INDIR/OK2.txt
awk '{gsub("GT:DP:AD:RO:QR:AO:QA:GL", "\t.", $0); print $0}' $INDIR/OK.txt > $INDIR/OK2.txt
awk '{gsub(" \t.", " .", $0); print $0}' $INDIR/OK2.txt > $INDIR/OK2a.txt
awk '{$10=""; print $0}' $INDIR/OK2a.txt > $INDIR/OK2b.txt
awk '{$3=$4=$4=$6=$7=$8=""; print $1"_"$2"\t"$0}' $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header.txt > $INDIR/OK_end1.txt
awk '{$2=$3=$4=""; print $0}' $INDIR/OK_end1.txt > $INDIR/OK_end1a.txt


awk '{gsub("GT:DP:AD:RO:QR:AO:QA:GL", "", $0); print $0}' $INDIR/OK_end1a.txt > $INDIR/OK_end3.txt


# On the only end file, remove all tabulation
sed -e 's/\t//g' $INDIR/OK_end3.txt > $INDIR/only_end2DC.txt

# remove the 0/0:, 0/1: and 1/1: in three step
cat $INDIR/only_end2DC.txt | awk '{gsub("0/1:", "\t", $0); print $0}' > $INDIR/only_end3DC.txt
cat $INDIR/only_end3DC.txt | awk '{gsub("0/0:", "\t", $0); print $0}' > $INDIR/only_end4DC.txt
cat $INDIR/only_end4DC.txt | awk '{gsub("1/1:", "\t", $0); print $0}' > $INDIR/only_end5DC.txt


# Merge the start and the end together
join -a1 $INDIR/OK2b.txt $INDIR/only_end5DC.txt > $INDIR/individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt

# Remove temp files
rm $INDIR/OK_end1.txt 
rm $INDIR/OK_end1a.txt 
rm $INDIR/OK_end3.txt 
rm $INDIR/OK.txt 
rm $INDIR/OK2.txt 
rm $INDIR/OK2a.txt 
rm $INDIR/OK2b.txt 
rm $INDIR/only_end2DC.txt 
rm $INDIR/only_end3DC.txt 
rm $INDIR/only_end4DC.txt
rm $INDIR/only_end5DC.txt



# In R version (exept the beginning)

## In order to deal with some problems after Freebayes (less columns than usually / fusion of cells) and create a unique SNP name ("Scaffold name" + position)
#system('awk \'{$9=$10=$11=$12=$13=$14=$15=$16=$17=$18=$19=$20=$21=""; print $1"_"$2"\t"$0}\' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header.txt > OK.txt')
#system('awk \'{gsub("GT:DP:AD:RO:QR:AO:QA:GL", "", $0); print $0}\' OK.txt > OK2.txt')
#system('awk \'{gsub("GT:DP:AD:RO:QR:AO:QA:GL", "\t.", $0); print $0}\' OK.txt > OK2.txt')
#system('awk \'{gsub(" \t.", " .", $0); print $0}\' OK2.txt > OK2a.txt')
#system('awk \'{$10=""; print $0}\' OK2a.txt > OK2b.txt')
#system('awk \'{$3=$4=$4=$6=$7=$8=""; print $1"_"$2"\t"$0}\' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header.txt > OK_end1.txt')
#system('awk \'{$2=$3=$4=""; print $0}\' OK_end1.txt > OK_end1a.txt')
#
#
#system('awk \'{gsub("GT:DP:AD:RO:QR:AO:QA:GL", "", $0); print $0}\' OK_end1a.txt > OK_end3.txt')
#
#
## On the only end file, remove all tabulation
#system('sed -e \'s/\t//g\' OK_end3.txt > only_end2DC.txt')
#
## remove the 0/0:, 0/1: and 1/1: in three step
#system('cat only_end2DC.txt | awk \'{gsub("0/1:", "\t", $0); print $0}\' > only_end3DC.txt')
#system('cat only_end3DC.txt | awk \'{gsub("0/0:", "\t", $0); print $0}\' > only_end4DC.txt')
#system('cat only_end4DC.txt | awk \'{gsub("1/1:", "\t", $0); print $0}\' > only_end5DC.txt')
#
#
## Merge the start and the end together
#system('join -a1 OK2b.txt only_end5DC.txt > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v.vcf_decomposed_complex_no_header_inputRL_PL.txt')
#
## Remove temp files
#file.remove("OK_end1.txt", "OK_end1a.txt", "OK_end3.txt", "OK.txt", "OK2.txt", "OK2a.txt", "OK2b.txt", "only_end2DC.txt", "only_end3DC.txt", "only_end4DC.txt", "only_end5DC.txt")
#
