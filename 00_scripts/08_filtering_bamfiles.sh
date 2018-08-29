#!/usr/bin/env bash
#PBS -q omp
#PBS -l ncpus=16
#PBS -l mem=60gb
#PBS -l walltime=48:00:00

#Global variables
WORKING_DIRECTORY=/home1/scratch/plstenge/filtering_bamfiles
DATAOUTPUT=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped_filtered
INPUT=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
HEADER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/header.txt
SAMTOOLS_ENV=". /appli/bioinfo/samtools/latest/env.sh"
SAMTOOLS="samtools"
SAMTOOLS_FILTERING_PARAMS="-F 4 -F 256 -q 5 -f2"	#samtools filtering parameters
EXT="F4_F256_q5_f2"					#filtered bam file extension

# Samtools parameters explain:
# -F = do not output
# -q = Score quality to kept
# -f = only output
# -F 0x04 = to remove reads that did not align (code in hexadecimal)
# -F 0x02 = to only include paired reads (code in hexadecimal)

#	#	Decimal	Description of read
#	1	1	Read paired
#	2	2	Read mapped in proper pair
#	3	4	Read unmapped
#	4	8	Mate unmapped
#	5	16	Read reverse strand
#	6	32	Mate reverse strand
#	7	64	First in pair
#	8	128	Second in pair
#	9	256	Not primary alignment
#	10	512	Read fails platform/vendor quality checks
#	11	1024	Read is PCR or optical duplicate
#	12	2048	Supplementary alignment

$HEADER

cd $INPUT

$SAMTOOLS_ENV

$SAMTOOLS view -F 4 -F 256 -q 5 -f2 -b HI.4499.006.NS_Adaptor_16.pool8KJ.bam > HI.4499.006.NS_Adaptor_16.pool8KJ_filtered.bam
$SAMTOOLS view -F 4 -F 256 -q 5 -f2 -b HI.4506.003.NS_Adaptor_11.pool3TV.bam > HI.4506.003.NS_Adaptor_11.pool3TV_filtered.bam
$SAMTOOLS view -F 4 -F 256 -q 5 -f2 -b HI.4527.004.NS_Adaptor_20.pool12EV.bam > HI.4527.004.NS_Adaptor_20.pool12EV_filtered.bam
$SAMTOOLS view -F 4 -F 256 -q 5 -f2 -b HI.4527.007.NS_Adaptor_17.pool9KV.bam > HI.4527.007.NS_Adaptor_17.pool9KV_filtered.bam



# for file in $(ls *.bam)
#do
#	cp ${HEADER} ${SCRIPT}/filter_${file}.qsub ;
#	echo "${SAMTOOLS_ENV}" >> ${SCRIPT}/filter_${file}.qsub ;
#	echo "${SAMTOOLS} view -b ${SAMTOOLS_FILTERING_PARAMS} ${WORKING_DIRECTORY}/${file} > ${WORKING_DIRECTORY}/${file%.*}_${EXT}.bam " >> ${SCRIPT}/filter_${file}.qsub ;
#	echo "${SAMTOOLS} flagstat ${WORKING_DIRECTORY}/${file%.*}_${EXT}.bam > ${WORKING_DIRECTORY}/${file%.*}_${EXT}.flagstat " >> ${SCRIPT}/filter_${file}.qsub ;
#	echo "${SAMTOOLS} flagstat ${WORKING_DIRECTORY}/${file} > ${WORKING_DIRECTORY}/${file}.flagstat " >> ${SCRIPT}/filter_${file}.qsub ;
#	qsub ${SCRIPT}/filter_${file}.qsub ;
#done

