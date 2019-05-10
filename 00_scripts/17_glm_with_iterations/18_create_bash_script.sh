#!/bin/bash

#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g



DATADIRECTORY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/17_glm_with_iterations
#DATAOUTPUT=/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_fastqc_raw_data
SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/17_glm_with_iterations
#HEADER=/home1/datahome/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/header.txt




for FILE in $(ls $DATADIRECTORY/*.R)
do

echo "#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

DATAWORK=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/07_01_vcf_files_modified

cd \$DATAWORK

#Chargement de conda
export PATH=\$PATH:/appli/anaconda/2.7/bin

#Chargement de votre environnement
source activate /home1/datawork/plstenge/96_env_conda/glm

SCRIPT_R=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/${FILE##*/}

Rscript --vanilla \$SCRIPT_R >& \${SCRATCH}/${FILE##*/}.out" >> $SCRIPT/${FILE##*/}.sh ;
        

done ;


