#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATA=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped
OUTDIR=/home/datawork-rmpf/p_margaritifera/pl-pwgs/05_variant_call_freebayes
ASSEMBLY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta
TMP=/home1/scratch/plstenge/tmp # Path for temporary files
PICARD_TOOLS="source activate /home1/datawork/plstenge/96_env_conda/picard_tools" # version 2.18.14
SAMTOOLS="source activate /home1/datawork/plstenge/96_env_conda/samtools" # version 1.9
GATK="source activate /home1/datawork/plstenge/96_env_conda/gatk" # version 3.8

file=__BASE__

# 1) Marking duplicates and removing them
cd ${DATA}
$PICARD_TOOLS
time java -jar -Djava.io.TMPdir=$TMP picard/MarkDuplicates.jar I=${file} O=${OUTDIR}/${file%.*}_MD.bam M=${OUTDIR}/${file%.*}_MD_metrics.txt ASSUME_SORTED=TRUE VALIDATION_STRINGENCY=SILENT REMOVE_DUPLICATES=TRUE CREATE_INDEX=TRUE ;

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
$GATK
time gatk SplitNCigarReads --TMP_DIR ${TMP} -R $ASSEMBLY -I ${file%.*}_MD_sorted.bam -O ${OUTDIR}/${file%.*}_sorted_split.bam ;

# 4) Told it's pooling data
# En fait, étape uniquement dans Freebayes ?

# 5) Changing read's header avec PicardTools pour autoriser le pooling
# AddOrReplaceReadGroups = Replace read groups in a BAM file.This tool enables the user to replace all read groups 
# in the INPUT file with a single new read group and assign all reads to this read group in the OUTPUT BAM file.
# RGID (String)	Read Group ID Default value: 1. This option can be set to 'null' to clear the default value.
# RGLB (String)	Read Group library Required.
# RGPL (String)	Read Group platform (e.g. illumina, solid) Required.
# RGPU (String)	Read Group platform unit (eg. run barcode) Required.
# RGSM (String)	Read Group sample name Required.
# RGCN (String)	Read Group sequencing center name Default value: null.
# RGDS (String)	Read Group description Default value: null.
# RGDT (Iso8601Date)	Read Group run date Default value: null.
# RGPI (Integer)	Read Group predicted insert size Default value: null.
# RGPG (String)	Read Group program group Default value: null.
# RGPM (String)	Read Group platform model Default value: null.
$PICARD_TOOLS
id=${file##*/}
id=${file%.*}
time java -jar -Djava.io.TMPdir=$TMP picard/AddOrReplaceReadGroups.jar I=${OUTDIR}/${file%.*}_sorted_split.bam O=${OUTDIR}/${file%.*}_sorted_split_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM=${id}

# 6) Indexing bam
$SAMTOOLS
samtools index ${OUTDIR}/${file%.*}_sorted_split_RG.bam > ${OUTDIR}/${file%.*}_sorted_split_RG.bam.bai ;
samtools flagstat ${OUTDIR}/${file%.*}_sorted_split_RG.bam > ${OUTDIR}/${file%.*}_sorted_split_RG.bam.flagstat ;

