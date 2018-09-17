#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

data=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped
outdir=/home/datawork-rmpf/p_margaritifera/pl-pwgs/05_variant_call_freebayes
ref=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta
pic=		#path to picard tools version 1.119
tmp=/home1/scratch/plstenge/tmp # Path for temporary files
samtools=". /appli/bioinfo/samtools/latest/env.sh"
gatk=". /appli/bioinfo/gatk/latest/env.sh"

file=__BASE__

mkdir -p $outdir

#Marking duplicates and removing them
cd ${data}
time java -jar -Djava.io.tmpdir=$tmp ${pic}/MarkDuplicates.jar I=${file} O=${outdir}/${file%.*}_MD.bam M=${outdir}/${file%.*}_MD_metrics.txt ASSUME_SORTED=TRUE VALIDATION_STRINGENCY=SILENT REMOVE_DUPLICATES=true CREATE_INDEX=TRUE ;

file=${outdir}/${file%.*}_MD.bam

#Sorting & indexing bam files
cd ${outdir}
$samtools
samtools sort ${file} > ${file%.*}_sorted.bam ;
samtools index ${file%.*}_sorted.bam  > ${file%.*}_sorted.bam.bai  ;

#Correctiong N cigar reads
$gatk
time gatk SplitNCigarReads --TMP_DIR ${tmp} -R $ref -I ${file%.*}_sorted.bam -O ${file%.*}_sorted_split.bam ;

#Add read group information to bam files
id=${file##*/}
id=${file%.*}
time java -jar -Djava.io.tmpdir=$tmp ${pic}/AddOrReplaceReadGroups.jar I=${file%.*}_sorted_split.bam O=${file%.*}_sorted_split_RG.bam RGID=${id} RGLB=${id} RGPL=illumina RGPU=${id} RGSM=${id}

#Sorting & indexing final bam files
$samtools
samtools index ${file%.*}_sorted_split_RG.bam > ${file%.*}_sorted_split_RG.bam.bai ;
samtools flagstat ${file%.*}_sorted_split_RG.bam > ${file%.*}_sorted_split_RG.bam.flagstat ;

#Removing int files
rm ${file%.*}_sorted_split.bam
rm ${file%.*}_sorted.bam
rm ${file%.*}_sorted.bam.bai
rm ${file}
