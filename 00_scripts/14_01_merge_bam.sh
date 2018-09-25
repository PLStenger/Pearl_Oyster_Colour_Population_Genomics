#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

#Global variables
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts
DATA=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped
OUTDIR=/home1/scratch/plstenge/merged_bam
ASSEMBLY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta
TMP=/home1/scratch/plstenge/tmp # Path for temporary files
PICARD_TOOLS=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/95_software/picard-tools-1.119 
SAMTOOLS=". /appli/bioinfo/samtools/latest/env.sh" # samtools-1.4.1
GATK=". /appli/bioinfo/gatk/latest/env.sh" # version 4.0.2.1-0

file=__BASE__

# 1) Marking duplicates and removing them
cd ${DATA}
# module load java
time java -jar -Djava.io.tmpdir=$TMP ${PICARD_TOOLS}/MarkDuplicates.jar I=${file} O=${OUTDIR}/${file%.*}_MD.bam M=${OUTDIR}/${file%.*}_MD_metrics.txt ASSUME_SORTED=TRUE VALIDATION_STRINGENCY=SILENT REMOVE_DUPLICATES=TRUE CREATE_INDEX=TRUE ;

file=${OUTDIR}/${file%.*}_MD.bam

# 2) Supplementary step to prevent bug: sorting & indexing bam files
cd ${OUTDIR}
$SAMTOOLS
samtools sort ${file} > ${file%.*}_MD_sorted.bam ;
samtools index ${file%.*}_MD_sorted.bam  > ${file%.*}_MD_sorted.bam.bai  ;

# 3) Correctiong N cigar reads
# This tool identifies all N cigar elements in sequence reads, and creates k+1 new reads 
# (where k is the number of N cigar elements) that correspond to the segments of the original read beside/between 
# the splicing events represented by the Ns in the original CIGAR.
# The first read includes the bases that are to the left of the first N element, while the part of the read that is 
# to the right of the N (including the Ns) is hard clipped, and so on for the rest of the new reads.
cd ${OUTDIR}
$GATK
time gatk SplitNCigarReads --TMP_DIR ${TMP} -R $ASSEMBLY -I ${file%.*}_MD_sorted.bam -O ${file%.*}_sorted_split.bam ;

rm ${file%.*}_sorted.bam
rm ${file%.*}_sorted.bam.bai
rm ${file}
