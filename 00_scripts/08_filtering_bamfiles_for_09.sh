#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

#Global variables
WORKING_DIRECTORY=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
SAMTOOLS_ENV=". /appli/bioinfo/samtools/latest/env.sh"
SAMTOOLS="samtools"


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


cd $WORKING_DIRECTORY

$SAMTOOLS_ENV

$SAMTOOLS view -F 4 -F 256 -q 5 -f2 -b HI.4506.005.NS_Adaptor_9.pool1TR_05_mapping_unique_sequentiel.bam > HI.4506.005.NS_Adaptor_9.pool1TR_filtered.bam
