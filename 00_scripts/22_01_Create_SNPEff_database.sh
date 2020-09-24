#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

SNPEFF=/home/datawork-rmpf/p_margaritifera/pl-pwgs/98_programms/SNPeff #/Path/to/snpEff/Folder
GFF=/home2/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_genome/EVM_combined.gff3
FASTA=/home2/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_genome/sspace.final.scaffolds.fasta # 01_info_files/your_genome.fasta
DBNAME=sspace.final.scaffolds.fasta
WORKDIR=/home/datawork-rmpf/p_margaritifera/pl-pwgs/07_snpeff #/your/path/to/WGS_pipeline

cd $SNPEFF

#create necessary directories for analysis in the SNPeff program folder: a directory "data" in wich two other directories is created:
mkdir -p data
mkdir -p data/$DBNAME
mkdir -p data/genomes


# Copy files where they need to be. GFF in the $DBNAME directory, fasta in the "genomes" directory
#cp $WORKDIR/$GFF ./data/$DBNAME/genes.gff
cp $GFF ./data/$DBNAME/genes.gff
cp $FASTA ./data/genomes/$DBNAME.fa


#Modify the config file in order to add the new genome
echo "# Genome of your species, your_genome.fasta" >> snpEff.config
echo "$DBNAME.genome : $DBNAME" >> snpEff.config

java -Xmx115G -jar $SNPEFF/snpEff.jar build -gff3 -v $DBNAME
