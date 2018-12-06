# Ce script permet de pouvoir modifier et formater le VCF afin que snpEff puisse le lire
# Ces étapes peuvent se réaliser en local


- = input de l'étape précédente'

# Enlever le header (comprenant les "#")

grep -v "^#" individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_tests.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_tests_no_header.vcf

# Et pour stocker le header dans un autre fichier:

grep "^#" individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_tests.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_tests_header.vcf

# On va maintenant merged les noms de scaffold et la position des SNP afin d'avoir un nom unique pour chaque SNP

awk '{OFS = "_" ; print $1,$2}' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_tests_no_header.vcf | paste - individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_tests_no_header.vcf > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_tests_header.vcf_single_ID.vcf

# Après avec R, j'ai obtenue un fichier .txt avec le nom de mes 12355 snp qui ont une p-value inférieure à 0.00001 (Test du Chi2). (le nom est construit de la meme maniere, scaffold_position). Il se nomme snp_ind_DP20_single.txt

# puis on va chercher a avoir donc un vcf avec uniquement les snp qui nous interesse (les 12355)

awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_tests_header.vcf_single_ID.vcf snp_ind_DP20_single2.txt > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_tests_no_header_vcf_significant.vcf


# On va vérifier qu'il y a bien les 12355 snp:
wc -l individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_tests_no_header_vcf_significant.vcf

# ici le vcf est bon, mais il y a la colonne supplémentaire que l'on a rajouté (scaffold_position) à la fin qui nous gène, et il n'y a toujours pas le headerfunction .
# Donc, on va enlever la première colonne dans le individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_tests_no_header_snp.vcf
# sed -re 's/^[ ]//g' pour enlever l'espace en trop qui va apparaitre juste devant le nom unique du snp
# sed -re 's/ /\t/g'  car pour remplacer les espaces par des tabulations entre les différentes colonnes.

awk '{ $1=""; print $0 }' individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_tests_no_header_vcf_significant.vcf | sed -re 's/^[ ]//g' | sed -re 's/ /\t/g' | cat individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_tests_header.vcf - > individuals.vcf_DP20_maf0.1_miss1.vcf.recode_bcfm2M2v_tests_snpF_input_12355.vcf


 


