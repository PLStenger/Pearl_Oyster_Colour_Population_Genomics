#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATA=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_02_filtered
OUTDIR=/home2/scratch/plstenge/bam
ASSEMBLY=/home2/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_genome/sspace.final.scaffolds.fasta
TMP=/home2/scratch/plstenge/bam/tmp # Path for temporary files
PICARD_TOOLS=/home/datawork-rmpf/p_margaritifera/pl-pwgs/98_programms/picard_tools/share/picard-2.18.14-0
#/home/datawork-rmpf/p_margaritifera/pl-pwgs/98_programms/picard_tools-1.119 
SAMTOOLS=". /appli/bioinfo/samtools/latest/env.sh" # samtools-1.4.1
GATK=". /appli/bioinfo/gatk/latest/env.sh" # version 4.0.2.1-0

cd $DATA

export PATH=$PATH:/appli/anaconda/2.7/bin
source activate /home/datawork-rmpf/p_margaritifera/pl-pwgs/98_programms/picard_tools

# 1) Marking duplicates and removing them

#cd $DATA
#for FILE in $(ls $DATA/*_sorted.bam)

#do
#time java -jar -Djava.io.tmpdir=$TMP ${PICARD_TOOLS}/picard.jar MarkDuplicates I=${FILE##*/} O=${OUTDIR}/${FILE##*/}_MD.bam M=${OUTDIR}/${FILE##*/}_MD_metrics.txt ASSUME_SORTED=TRUE VALIDATION_STRINGENCY=SILENT REMOVE_DUPLICATES=TRUE CREATE_INDEX=TRUE ;
#done;

# 2) Supplementary step to prevent bug: sorting & indexing bam files
#cd $OUTDIR
#$SAMTOOLS

#for FILE in $(ls $OUTDIR/*_MD.bam)

#do
#samtools sort ${FILE##*/} > ${FILE##*/}_sorted.bam ;
#samtools index ${FILE##*/}_sorted.bam  > ${FILE##*/}.bai  ;
#done;

# 3) Correctiong N cigar reads
# This tool identifies all N cigar elements in sequence reads, and creates k+1 new reads 
# (where k is the number of N cigar elements) that correspond to the segments of the original read beside/between 
# the splicing events represented by the Ns in the original CIGAR.
# The first read includes the bases that are to the left of the first N element, while the part of the read that is 
# to the right of the N (including the Ns) is hard clipped, and so on for the rest of the new reads.


# Create the dictionnary
#java -jar ${PICARD_TOOLS}/picard.jar CreateSequenceDictionary R= /home2/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_genome/sspace.final.scaffolds.fasta O= /home2/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_genome/sspace.final.scaffolds.dict


cd $OUTDIR
$GATK

for FILE in $(ls $OUTDIR/*_sorted.bam)

do
#time gatk SplitNCigarReads --TMP_DIR ${TMP} -R $ASSEMBLY -I ${FILE##*/} -O ${FILE##*/}_split.bam ;
#time gatk SplitNCigarReads -R $ASSEMBLY -I ${FILE##*/} -O ${FILE##*/}_split.bam ;
gatk SplitNCigarReads -R $ASSEMBLY -I ${FILE##*/} -O ${FILE##*/}_split.bam ;
done;

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


cd $OUTDIR
for FILE in $(ls $OUTDIR/*_split.bam)

do
id=${FILE##*/}
time java -jar -Djava.io.TMPdir=$TMP ${PICARD_TOOLS}/picard.jar AddOrReplaceReadGroups I=${FILE##*/} O=${FILE##*/}_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM=${id}
#time java -jar -Djava.io.TMPdir=$TMP ${PICARD_TOOLS}/picard.jar AddOrReplaceReadGroups.jar I=${FILE##*/} O=${FILE##*/}_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM=${id}
done;

# 6) Indexing bam

cd $OUTDIR
$SAMTOOLS

for FILE in $(ls $OUTDIR/*_RG.bam)

do
samtools index ${FILE##*/} > ${FILE##*/}.bai ;
samtools flagstat ${FILE##*/} > ${FILE##*/}.flagstat ;
done;

# 7) Removing int files
# rm ${file%.*}_sorted_split.bam
# rm ${file%.*}_sorted.bam
# rm ${file%.*}_sorted.bam.bai
# rm ${file}
