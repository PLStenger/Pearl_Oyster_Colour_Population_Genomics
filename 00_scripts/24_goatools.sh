#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g

# Global variables
WORKING_DIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/10_goatools
GOATOOLS=/Users/pierre-louisstenger/Desktop/go_enrichment-master/goatools/scripts/find_enrichment.py
FISHER_FOLDER=06_fisher_tests
GO_DATABASE=02_go_database/go.obo
SIGNIFICANT_IDS=03_sequences/significant_ids.txt
ALL_IDS=03_sequences/all_ids.txt
ANNOTATIONS=05_annotations/all_go_annotations_test3.tab
ENRICHMENT=06_fisher_tests/go_enrichment.csv

cd $WORKING_DIRECTORY

#Chargement de conda
export PATH=$PATH:/appli/anaconda/2.7/bin

#Chargement de votre environnement
source activate /home1/datawork/plstenge/96_env_conda/goatools


# Running goa tools
python $WORKING_DIRECTORY/find_enrichment.py --pval=0.05 --indent --obo $WORKING_DIRECTORY/go.obo $WORKING_DIRECTORY/significant_ids.txt $WORKING_DIRECTORY/all_ids.txt $WORKING_DIRECTORY/all_go_annotations_test3.tab > $WORKING_DIRECTORY/go_enrichment.csv

# python $WORKING_DIRECTORY/find_enrichment.py --pval=0.05 --indent --obo $WORKING_DIRECTORY/go.obo significant_ids.txt all_ids.txt all_go_annotations_test3.tab > $WORKING_DIRECTORY/go_enrichment.csv


# python scripts/find_enrichment.py --pval=0.05 --indent data/study \
#                                  data/population data/association
