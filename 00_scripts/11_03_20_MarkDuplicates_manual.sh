#!/usr/bin/env bash
#PBS -q sequentiel
#PBS -l ncpus=1
#PBS -l mem=180g
#PBS -l walltime=96:00:00

DATA=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped
OUTDIR=/home1/scratch/creisser/PL_BAM_MD
ASSEMBLY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta
TMP=/home1/scratch/creisser/PL_BAM_MD/tmp # Path for temporary files
PICARD_TOOLS=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/95_software/picard-tools-1.119 
SAMTOOLS=". /appli/bioinfo/samtools/latest/env.sh" # samtools-1.4.1
GATK=". /appli/bioinfo/gatk/latest/env.sh" # version 4.0.2.1-0

file=HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted.bam


# 1) Marking duplicates and removing them
cd ${DATA}
# module load java
time java -jar -Djava.io.tmpdir=$TMP ${PICARD_TOOLS}/MarkDuplicates.jar I=${file} O=${OUTDIR}/HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD.bam M=${OUTDIR}/HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD_metrics.txt ASSUME_SORTED=TRUE VALIDATION_STRINGENCY=SILENT REMOVE_DUPLICATES=TRUE CREATE_INDEX=TRUE ;

file=${OUTDIR}/HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD.bam

# 2) Supplementary step to prevent bug: sorting & indexing bam files
cd ${OUTDIR}
$SAMTOOLS
samtools sort HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD.bam > HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD_sorted.bam ;
samtools index HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD_sorted.bam > HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD_sorted.bai  ;

# 3) Correctiong N cigar reads
# This tool identifies all N cigar elements in sequence reads, and creates k+1 new reads 
# (where k is the number of N cigar elements) that correspond to the segments of the original read beside/between 
# the splicing events represented by the Ns in the original CIGAR.
# The first read includes the bases that are to the left of the first N element, while the part of the read that is 
# to the right of the N (including the Ns) is hard clipped, and so on for the rest of the new reads.
cd ${OUTDIR}
$GATK
time gatk SplitNCigarReads --TMP_DIR ${TMP} -R $ASSEMBLY -I HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD_sorted.bam -O HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD_sorted_split.bam ;

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
cd ${OUTDIR}
id=${file##*/}
id=${file%.*}
time java -jar -Djava.io.TMPdir=$TMP ${PICARD_TOOLS}/AddOrReplaceReadGroups.jar I=HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD_sorted_split.bam O=HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD_sorted_split_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM=${id}

# 6) Indexing bam
cd ${OUTDIR}
$SAMTOOLS
samtools index HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD_sorted_split_RG.bam > HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD_sorted_split_RG.bam.bai ;
samtools flagstat HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD_sorted_split_RG.bam.bam > HI.4527.004.NS_Adaptor_20.pool12EV_filtered_sorted_MD_sorted_split_RG.bam.flagstat ;

# 7) Removing int files
# rm ${file%.*}_sorted_split.bam
# rm ${file%.*}_sorted.bam
# rm ${file%.*}_sorted.bam.bai
# rm ${file}
