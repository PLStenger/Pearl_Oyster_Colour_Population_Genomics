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
GATK=". /appli/bioinfo/gatk/latest/env.sh" # version 4.0.2.1-

# 1) Changing read's header avec PicardTools pour autoriser le pooling
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
cd ${OUTDIR}
time java -jar -Djava.io.TMPdir=$TMP ${PICARD_TOOLS}/AddOrReplaceReadGroups.jar I=$OOOOOOO_sorted_split.bam O=$OOOOOOO_sorted_split_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM="red"
time java -jar -Djava.io.TMPdir=$TMP ${PICARD_TOOLS}/AddOrReplaceReadGroups.jar I=$OOOOOOO_sorted_split.bam O=$OOOOOOO_sorted_split_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM="red"
time java -jar -Djava.io.TMPdir=$TMP ${PICARD_TOOLS}/AddOrReplaceReadGroups.jar I=$OOOOOOO_sorted_split.bam O=$OOOOOOO_sorted_split_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM="red"
time java -jar -Djava.io.TMPdir=$TMP ${PICARD_TOOLS}/AddOrReplaceReadGroups.jar I=$OOOOOOO_sorted_split.bam O=$OOOOOOO_sorted_split_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM="red"
time java -jar -Djava.io.TMPdir=$TMP ${PICARD_TOOLS}/AddOrReplaceReadGroups.jar I=$OOOOOOO_sorted_split.bam O=$OOOOOOO_sorted_split_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM="yellow"
time java -jar -Djava.io.TMPdir=$TMP ${PICARD_TOOLS}/AddOrReplaceReadGroups.jar I=$OOOOOOO_sorted_split.bam O=$OOOOOOO_sorted_split_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM="yellow"
time java -jar -Djava.io.TMPdir=$TMP ${PICARD_TOOLS}/AddOrReplaceReadGroups.jar I=$OOOOOOO_sorted_split.bam O=$OOOOOOO_sorted_split_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM="yellow"
time java -jar -Djava.io.TMPdir=$TMP ${PICARD_TOOLS}/AddOrReplaceReadGroups.jar I=$OOOOOOO_sorted_split.bam O=$OOOOOOO_sorted_split_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM="yellow"
time java -jar -Djava.io.TMPdir=$TMP ${PICARD_TOOLS}/AddOrReplaceReadGroups.jar I=$OOOOOOO_sorted_split.bam O=$OOOOOOO_sorted_split_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM="green"
time java -jar -Djava.io.TMPdir=$TMP ${PICARD_TOOLS}/AddOrReplaceReadGroups.jar I=$OOOOOOO_sorted_split.bam O=$OOOOOOO_sorted_split_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM="green"
time java -jar -Djava.io.TMPdir=$TMP ${PICARD_TOOLS}/AddOrReplaceReadGroups.jar I=$OOOOOOO_sorted_split.bam O=$OOOOOOO_sorted_split_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM="green"
time java -jar -Djava.io.TMPdir=$TMP ${PICARD_TOOLS}/AddOrReplaceReadGroups.jar I=$OOOOOOO_sorted_split.bam O=$OOOOOOO_sorted_split_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM="green"


# 2) Indexing bam
# cd ${OUTDIR}
#$SAMTOOLS
#samtools index ${file%.*}_sorted_split_RG.bam > ${file%.*}_sorted_split_RG.bam.bai ;
#samtools flagstat ${file%.*}_sorted_split_RG.bam > ${file%.*}_sorted_split_RG.bam.flagstat ;

# 3) Removing int files
# rm ${file%.*}_sorted_split.bam
# rm ${file}
