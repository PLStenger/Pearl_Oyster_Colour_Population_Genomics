#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g

# Global variables
WORKING_DIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/10_01_goatools/go_enrichment
GOATOOLS=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/10_01_goatools/go_enrichment/01_scripts
FISHER_FOLDER=06_fisher_tests
GO_DATABASE=02_go_database
SIGNIFICANT_IDS=03_sequences
ALL_IDS=03_sequences
ANNOTATIONS=05_annotations
ENRICHMENT=06_fisher_tests

cd $WORKING_DIRECTORY

#Chargement de conda
export PATH=$PATH:/appli/anaconda/2.7/bin

#Chargement de votre environnement
source activate /home1/datahome/plstenge/goatools2


# Running goa tools
python $GOATOOLS/find_enrichment.py --pval=0.05 --indent --obo $GO_DATABASE/go.obo $SIGNIFICANT_IDS/significant_ids_RvsJ.txt $ALL_IDS/all_ids.txt $ANNOTATIONS/all_go_annotations_test3.tab > $FISHER_FOLDER/go_enrichment_Chi2_RvsJ.csv

# python $WORKING_DIRECTORY/find_enrichment.py --pval=0.05 --indent --obo $WORKING_DIRECTORY/go.obo significant_ids.txt all_ids.txt all_go_annotations_test3.tab > $WORKING_DIRECTORY/go_enrichment.csv


# python scripts/find_enrichment.py --pval=0.05 --indent data/study \
#                                  data/population data/association
