#!/usr/bin/env bash
#PBS -N trimmomaticHI.4499.007.NS_Adaptor_15.pool7KR
#PBS -o 98_log_files/trimmomaticHI.4499.007.NS_Adaptor_15.pool7KR.out
#PBS -q omp
#PBS -l ncpus=8
#PBS -l mem=60gb
#PBS -l walltime=96:00:00
#PBS -r n

# Header
DATADIRECTORY=/home/ref-bioinfo/ifremer/rmpf/Pmarg_color_WGS_2018/data/dna-sequence-raw
DATAOUTPUT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/03_trimmed_q26
SCRIPT=$0
HEADER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/header.txt
TRIMMOMATICENV=". /appli/bioinfo/trimmomatic/latest/env.sh"
TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
LOG_FOLDER=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/98_log_files
NAME=$(basename $0)

cd $PBS_O_WORKDIR

# Global variables

#>Illumina_TruSeq_LT_R1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC
#>Illumina_TruSeq_LT_R2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT
ADAPTERFILE=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/adapters.fasta
NCPU=8
base=HI.4499.007.NS_Adaptor_15.pool7KR


$TRIMMOMATICENV

cp $SCRIPT $LOG_FOLDER/"$TIMESTAMP"_"$NAME"


trimmomatic PE -Xmx60G \
        -threads 8 \
        -phred33 \
        $DATADIRECTORY/"$base"_R1.fastq.gz \
        $DATADIRECTORY/"$base"_R2.fastq.gz \
        $DATAOUTPUT/"$base"_R1.paired.fastq.gz \
        $DATAOUTPUT/"$base"_R1.single.fastq.gz \
        $DATAOUTPUT/"$base"_R2.paired.fastq.gz \
        $DATAOUTPUT/"$base"_R2.single.fastq.gz \
        ILLUMINACLIP:"$ADAPTERFILE":2:30:10 \
        LEADING:26 \
        TRAILING:26 \
        SLIDINGWINDOW:24:26 \
        MINLEN:40 2> $LOG_FOLDER/log.trimmomatic.pe."$TIMESTAMP"
