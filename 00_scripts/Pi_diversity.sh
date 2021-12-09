#!/usr/bin/env line

DATA_DIRECTORY=/Users/pierre-louisstenger/Desktop/run

cd $DATA_DIRECTORY

for FILE in $(ls $DATA_DIRECTORY/*_P_0_000000001.vcf.recode.vcf)
do
	
	# Create vcf file with only header
	grep "^#" $FILE > ${FILE##*/}_header.vcf
	# Create vcf file without header
	grep -v "^#" $FILE > ${FILE##*/}_no_header.vcf
	
	sed $'s/\tHI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.001.NS_Adaptor_13.pool5GJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.004.NS_Adaptor_10.pool2TJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.008.NS_Adaptor_14.pool6GV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.005.NS_Adaptor_19.pool11EJ_filtered_sorted.bam_MD.bam_sorted.bam/\t/g' ${FILE##*/}_header.vcf > ${FILE##*/}_header_KV.vcf
	
	sed $'s/\tHI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted.bam_MD.bam_sorted.bam\t/\t/g' ${FILE##*/}_header.vcf > ${FILE##*/}_header_GR1.vcf
	sed $'s/HI.4506.001.NS_Adaptor_13.pool5GJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.004.NS_Adaptor_10.pool2TJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.008.NS_Adaptor_14.pool6GV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.005.NS_Adaptor_19.pool11EJ_filtered_sorted.bam_MD.bam_sorted.bam/\t/g' ${FILE##*/}_header_GR1.vcf > ${FILE##*/}_header_GR.vcf
	
	sed $'s/\tHI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted.bam_MD.bam_sorted.bam\t/\t/g' ${FILE##*/}_header.vcf > ${FILE##*/}_header_GJ1.vcf
	sed $'s/HI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.004.NS_Adaptor_10.pool2TJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.008.NS_Adaptor_14.pool6GV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.005.NS_Adaptor_19.pool11EJ_filtered_sorted.bam_MD.bam_sorted.bam/\t/g' ${FILE##*/}_header_GJ1.vcf > ${FILE##*/}_header_GJ.vcf
	
	sed $'s/\tHI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.001.NS_Adaptor_13.pool5GJ_filtered_sorted.bam_MD.bam_sorted.bam\t/\t/g' ${FILE##*/}_header.vcf > ${FILE##*/}_header_KJ1.vcf
	sed $'s/\tHI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.004.NS_Adaptor_10.pool2TJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.008.NS_Adaptor_14.pool6GV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.005.NS_Adaptor_19.pool11EJ_filtered_sorted.bam_MD.bam_sorted.bam/\t/g' ${FILE##*/}_header_KJ1.vcf > ${FILE##*/}_header_KJ.vcf
	
	sed $'s/\tHI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.001.NS_Adaptor_13.pool5GJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted.bam_MD.bam_sorted.bam\t/\t/g' ${FILE##*/}_header.vcf > ${FILE##*/}_header_KR1.vcf
	sed $'s/HI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.004.NS_Adaptor_10.pool2TJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.008.NS_Adaptor_14.pool6GV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.005.NS_Adaptor_19.pool11EJ_filtered_sorted.bam_MD.bam_sorted.bam/\t/g' ${FILE##*/}_header_KR1.vcf > ${FILE##*/}_header_KR.vcf
	
	sed $'s/\tHI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.001.NS_Adaptor_13.pool5GJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted.bam_MD.bam_sorted.bam\t/\t/g' ${FILE##*/}_header.vcf > ${FILE##*/}_header_TV1.vcf
	sed $'s/HI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.004.NS_Adaptor_10.pool2TJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.008.NS_Adaptor_14.pool6GV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.005.NS_Adaptor_19.pool11EJ_filtered_sorted.bam_MD.bam_sorted.bam/\t/g' ${FILE##*/}_header_TV1.vcf > ${FILE##*/}_header_TV.vcf
	
	sed $'s/\tHI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.001.NS_Adaptor_13.pool5GJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted.bam_MD.bam_sorted.bam\t/\t/g' ${FILE##*/}_header.vcf > ${FILE##*/}_header_TR1.vcf
	sed $'s/HI.4506.004.NS_Adaptor_10.pool2TJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.008.NS_Adaptor_14.pool6GV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.005.NS_Adaptor_19.pool11EJ_filtered_sorted.bam_MD.bam_sorted.bam/\t/g' ${FILE##*/}_header_TR1.vcf > ${FILE##*/}_header_TR.vcf
	
	sed $'s/\tHI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.001.NS_Adaptor_13.pool5GJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted.bam_MD.bam_sorted.bam\t/\t/g' ${FILE##*/}_header.vcf > ${FILE##*/}_header_TJ1.vcf
	sed $'s/HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.008.NS_Adaptor_14.pool6GV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.005.NS_Adaptor_19.pool11EJ_filtered_sorted.bam_MD.bam_sorted.bam/\t/g' ${FILE##*/}_header_TJ1.vcf > ${FILE##*/}_header_TJ.vcf
	
	sed $'s/\tHI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.001.NS_Adaptor_13.pool5GJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.004.NS_Adaptor_10.pool2TJ_filtered_sorted.bam_MD.bam_sorted.bam\t/\t/g' ${FILE##*/}_header.vcf > ${FILE##*/}_header_EV1.vcf
	sed $'s/HI.4499.008.NS_Adaptor_14.pool6GV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.005.NS_Adaptor_19.pool11EJ_filtered_sorted.bam_MD.bam_sorted.bam/\t/g' ${FILE##*/}_header_EV1.vcf > ${FILE##*/}_header_EV.vcf
	
	sed $'s/\tHI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.001.NS_Adaptor_13.pool5GJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.004.NS_Adaptor_10.pool2TJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted.bam_MD.bam_sorted.bam\t/\t/g' ${FILE##*/}_header.vcf > ${FILE##*/}_header_GV1.vcf
	sed $'s/HI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.005.NS_Adaptor_19.pool11EJ_filtered_sorted.bam_MD.bam_sorted.bam/\t/g' ${FILE##*/}_header_GV1.vcf > ${FILE##*/}_header_GV.vcf
	
	sed $'s/\tHI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.001.NS_Adaptor_13.pool5GJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.004.NS_Adaptor_10.pool2TJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.008.NS_Adaptor_14.pool6GV_filtered_sorted.bam_MD.bam_sorted.bam\t/\t/g' ${FILE##*/}_header.vcf > ${FILE##*/}_header_ER1.vcf
	sed $'s/HI.4527.005.NS_Adaptor_19.pool11EJ_filtered_sorted.bam_MD.bam_sorted.bam/\t/g' ${FILE##*/}_header_ER1.vcf > ${FILE##*/}_header_ER.vcf
	
	sed $'s/\tHI.4527.007.NS_Adaptor_17.pool9KV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.002.NS_Adaptor_12.pool4GR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.001.NS_Adaptor_13.pool5GJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.006.NS_Adaptor_16.pool8KJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.007.NS_Adaptor_15.pool7KR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.003.NS_Adaptor_11.pool3TV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.005.NS_Adaptor_9.pool1TR_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4506.004.NS_Adaptor_10.pool2TJ_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4499.008.NS_Adaptor_14.pool6GV_filtered_sorted.bam_MD.bam_sorted.bam\tHI.4527.006.NS_Adaptor_18.pool10ER_filtered_sorted.bam_MD.bam_sorted.bam\t/\t/g' ${FILE##*/}_header.vcf > ${FILE##*/}_header_EJ.vcf

	##################################
	####### KV = Katiu - Green #######
	##################################
	# Keep only information for the first pool :
	awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10}' ${FILE##*/}_no_header.vcf > ${FILE##*/}_no_header_KV.vcf
	# Here paste de good header to the VCF
	cat ${FILE##*/}_header_KV.vcf ${FILE##*/}_no_header_KV.vcf > ${FILE##*/}_recode_KV.vcf
	# Run Pi :
	vcftools --vcf ${FILE##*/}_recode_KV.vcf --window-pi 10000 --out ${FILE##*/}_pi_10kb_KV.txt
	
	##################################
	####### GR = Gambier - Red #######
	##################################
	# Keep only information for the first pool :
	awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$11}' ${FILE##*/}_no_header.vcf > ${FILE##*/}_no_header_GR.vcf
	# Here paste de good header to the VCF
	cat ${FILE##*/}_header_GR.vcf ${FILE##*/}_no_header_GR.vcf > ${FILE##*/}_recode_GR.vcf
	# Run Pi :
	vcftools --vcf ${FILE##*/}_recode_GR.vcf --window-pi 10000 --out ${FILE##*/}_pi_10kb_GR.txt	
	
	##################################
	##### GJ = Gambier - Yellow ######
	##################################
	# Keep only information for the first pool :
	awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$12}' ${FILE##*/}_no_header.vcf > ${FILE##*/}_no_header_GJ.vcf
	# Here paste de good header to the VCF
	cat ${FILE##*/}_header_GJ.vcf ${FILE##*/}_no_header_GJ.vcf > ${FILE##*/}_recode_GJ.vcf
	# Run Pi :
	vcftools --vcf ${FILE##*/}_recode_GJ.vcf --window-pi 10000 --out ${FILE##*/}_pi_10kb_GJ.txt	
	
	##################################
	##### KJ = Katiu - Yellow ########
	##################################
	# Keep only information for the first pool :
	awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$13}' ${FILE##*/}_no_header.vcf > ${FILE##*/}_no_header_KJ.vcf
	# Here paste de good header to the VCF
	cat ${FILE##*/}_header_KJ.vcf ${FILE##*/}_no_header_KJ.vcf > ${FILE##*/}_recode_KJ.vcf
	# Run Pi :
	vcftools --vcf ${FILE##*/}_recode_KJ.vcf --window-pi 10000 --out ${FILE##*/}_pi_10kb_KJ.txt	
	
	##################################
	####### KR = Katiu - Red #########
	##################################
	# Keep only information for the first pool :
	awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$14}' ${FILE##*/}_no_header.vcf > ${FILE##*/}_no_header_KR.vcf
	# Here paste de good header to the VCF
	cat ${FILE##*/}_header_KR.vcf ${FILE##*/}_no_header_KR.vcf > ${FILE##*/}_recode_KR.vcf
	# Run Pi :
	vcftools --vcf ${FILE##*/}_recode_KR.vcf --window-pi 10000 --out ${FILE##*/}_pi_10kb_KR.txt	
	
	##################################
	##### TV = Takapoto - Green ######
	##################################
	# Keep only information for the first pool :
	awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$15}' ${FILE##*/}_no_header.vcf > ${FILE##*/}_no_header_TV.vcf
	# Here paste de good header to the VCF
	cat ${FILE##*/}_header_TV.vcf ${FILE##*/}_no_header_TV.vcf > ${FILE##*/}_recode_TV.vcf
	# Run Pi :
	vcftools --vcf ${FILE##*/}_recode_TV.vcf --window-pi 10000 --out ${FILE##*/}_pi_10kb_TV.txt	
	
	##################################
	##### TR = Takapoto - Red11 ######
	##################################
	# Keep only information for the first pool :
	awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$16}' ${FILE##*/}_no_header.vcf > ${FILE##*/}_no_header_TR.vcf
	# Here paste de good header to the VCF
	cat ${FILE##*/}_header_TR.vcf ${FILE##*/}_no_header_TR.vcf > ${FILE##*/}_recode_TR.vcf
	# Run Pi :
	vcftools --vcf ${FILE##*/}_recode_TR.vcf --window-pi 10000 --out ${FILE##*/}_pi_10kb_TR.txt	
	
	##################################
	##### TJ = Takapoto - Yellow #####
	##################################
	# Keep only information for the first pool :
	awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$17}' ${FILE##*/}_no_header.vcf > ${FILE##*/}_no_header_TJ.vcf
	# Here paste de good header to the VCF
	cat ${FILE##*/}_header_TJ.vcf ${FILE##*/}_no_header_TJ.vcf > ${FILE##*/}_recode_TJ.vcf
	# Run Pi :
	vcftools --vcf ${FILE##*/}_recode_TJ.vcf --window-pi 10000 --out ${FILE##*/}_pi_10kb_TJ.txt	
	
	##################################
	##### EV = Hatchery - Green ######
	##################################
	# Keep only information for the first pool :
	awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$18}' ${FILE##*/}_no_header.vcf > ${FILE##*/}_no_header_EV.vcf
	# Here paste de good header to the VCF
	cat ${FILE##*/}_header_EV.vcf ${FILE##*/}_no_header_EV.vcf > ${FILE##*/}_recode_EV.vcf
	# Run Pi :
	vcftools --vcf ${FILE##*/}_recode_EV.vcf --window-pi 10000 --out ${FILE##*/}_pi_10kb_EV.txt	
	
	##################################
	###### GV = Gambier - Green ######
	##################################
	# Keep only information for the first pool :
	awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$19}' ${FILE##*/}_no_header.vcf > ${FILE##*/}_no_header_GV.vcf
	# Here paste de good header to the VCF
	cat ${FILE##*/}_header_GV.vcf ${FILE##*/}_no_header_GV.vcf > ${FILE##*/}_recode_GV.vcf
	# Run Pi :
	vcftools --vcf ${FILE##*/}_recode_GV.vcf --window-pi 10000 --out ${FILE##*/}_pi_10kb_GV.txt	
	
	##################################
	####### ER = Hatchery - Red ######
	##################################
	# Keep only information for the first pool :
	awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$12}' ${FILE##*/}_no_header.vcf > ${FILE##*/}_no_header_ER.vcf
	# Here paste de good header to the VCF
	cat ${FILE##*/}_header_ER.vcf ${FILE##*/}_no_header_ER.vcf > ${FILE##*/}_recode_ER.vcf
	# Run Pi :
	vcftools --vcf ${FILE##*/}_recode_ER.vcf --window-pi 10000 --out ${FILE##*/}_pi_10kb_ER.txt	
	
	##################################
	##### EJ = HatchEJy - Yellow #####
	##################################
	# Keep only information for the first pool :
	awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$21}' ${FILE##*/}_no_header.vcf > ${FILE##*/}_no_header_EJ.vcf
	# HEJe paste de good headEJ to the VCF
	cat ${FILE##*/}_header_EJ.vcf ${FILE##*/}_no_header_EJ.vcf > ${FILE##*/}_recode_EJ.vcf
	# Run Pi :
	vcftools --vcf ${FILE##*/}_recode_EJ.vcf --window-pi 10000 --out ${FILE##*/}_pi_10kb_EJ.txt	
	
	
done ;



awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_EJ.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_EJ.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_ER.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_ER.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_EV.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_EV.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GJ.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GJ.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GR.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GR.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GV.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GV.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KJ.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KJ.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KR.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KR.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KV.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KV.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TJ.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TJ.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TR.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TR.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TV.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TV.txt.windowed.pi_last_column.txt
 
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_EJ.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_EJ.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_ER.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_ER.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_EV.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_EV.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GJ.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GJ.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GR.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GR.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GV.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GV.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KJ.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KJ.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KR.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KR.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KV.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KV.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TJ.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TJ.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TR.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TR.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TV.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TV.txt.windowed.pi_last_column.txt
 
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_EJ.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_EJ.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_ER.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_ER.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_EV.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_EV.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_GJ.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_GJ.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_GR.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_GR.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_GV.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_GV.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_KJ.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_KJ.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_KR.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_KR.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_KV.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_KV.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_TJ.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_TJ.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_TR.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_TR.txt.windowed.pi_last_column.txt
awk '{print $5}' individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_TV.txt.windowed.pi > individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_TV.txt.windowed.pi_last_column.txt




cat individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_EJ.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_EJ.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_EJ.txt.windowed.pi_last_column.txt > results_pi_EJ.txt
cat individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_ER.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_ER.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_ER.txt.windowed.pi_last_column.txt > results_pi_ER.txt
cat individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_EV.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_EV.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_EV.txt.windowed.pi_last_column.txt > results_pi_EV.txt
cat individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_GJ.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GJ.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GJ.txt.windowed.pi_last_column.txt > results_pi_GJ.txt
cat individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_GR.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GR.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GR.txt.windowed.pi_last_column.txt > results_pi_GR.txt
cat individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_GV.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GV.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_GV.txt.windowed.pi_last_column.txt > results_pi_GV.txt
cat individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_KJ.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KJ.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KJ.txt.windowed.pi_last_column.txt > results_pi_KJ.txt
cat individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_KR.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KR.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KR.txt.windowed.pi_last_column.txt > results_pi_KR.txt
cat individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_KV.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KV.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_KV.txt.windowed.pi_last_column.txt > results_pi_KV.txt
cat individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_TJ.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TJ.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TJ.txt.windowed.pi_last_column.txt > results_pi_TJ.txt
cat individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_TR.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TR.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TR.txt.windowed.pi_last_column.txt > results_pi_TR.txt
cat individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsR_P_0_000000001.vcf.recode.vcf_pi_10kb_TV.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_YvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TV.txt.windowed.pi_last_column.txt individuals.vcf_DP20_maf0.1_miss1_recode_bcfm2M2v_decomposed_complex_RvsG_P_0_000000001.vcf.recode.vcf_pi_10kb_TV.txt.windowed.pi_last_column.txt > results_pi_TV.txt


