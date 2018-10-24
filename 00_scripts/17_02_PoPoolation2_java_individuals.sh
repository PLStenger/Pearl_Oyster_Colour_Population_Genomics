#!/usr/bin/env bash
#PBS -v DOCKER_IMAGE=“docker.ifremer.fr/bioinfo/popoolation2:1201”
#PBS -q omp
#PBS -l ncpus=8
#PBS -l mem=8g
#PBS -l walltime=48:00:00

BAM=/home1/scratch/plstenge/freebayes	

cd $BAM

# java -ea -Xmx7g -jar $POPOO_HOME/mpileup2sync.jar --input all_12_bam.mpileup --output all_12_bam_mpileup_java.sync --fastq-type sanger --min-qual 20 --threads 8 >& $HOME/popoo_sync.log

perl  $POPOO_HOME/fisher-test.pl --fastq-type sanger --min-qual 20 --input all_12_bam.mpileup --output all_12_bam.mpileup.sync >& $HOME/popoo_sync.log


# Vai:
#perl $POPOO_HOME/fisher-test.pl --input $DATADIR/PoolFemalesVSAllMales_trimmed_genome_java.sync \
#                       --output $DATADIR/PoolFemalesVSAllMales_trimmed_genome_minDP7.fet \
#                       --suppress-noninformative \
#                       --min-coverage 7 \
#                       2> "$LOG_FOLDER"/log.FET_PoolFemalesVSAllMales_trimmed_genome_minDP7_popoodocker."$TIMESTAMP"

