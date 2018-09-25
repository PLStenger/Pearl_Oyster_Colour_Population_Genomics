#!/usr/bin/env bash

SCRIPT=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/00_scripts/14_01_merge_bam.sh
DATA=/home/datawork-rmpf/p_margaritifera/pl-pwgs/03_mapped

# cat = pour concaténer des fichiers ainsi que d'afficher leur contenu sur la sortie standard
# sed = lit des données d'entrée ligne par ligne, modifie chaque ligne selon des règles spécifiées dans un langage propre (appelé « script sed »), puis retourne le contenu du fichier (par défaut).
# eval = permet d'exécuter une commande à partir d'une chaîne de caractères (ou String) générée par le programme lui-même en cours d'exécution

# Donc, ce script permet de créer un script pour chaque "bam" en utilisant le script "11_01_MarkDuplicates.sh" et rempalce le "__BASE__" par le bon fichier.

for file in $(ls ${DATA}/*_sorted.bam)
do
	base=${file##*/}
	name=${base%.*}
	suffix="merged_bam"
        toEval="cat ${SCRIPT} | sed 's/__BASE__/$base/g'"; eval $toEval > ${SCRIPT%.*}_$name_$suffix.qsub
	echo $toEval
	# qsub ${SCRIPT%.*}_$name_$suffix.qsub
done
