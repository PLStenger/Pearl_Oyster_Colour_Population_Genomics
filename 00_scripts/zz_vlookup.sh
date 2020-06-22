#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=28:mem=115g

#cd /home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data
cd /home1/scratch/plstenge/genome

#awk '
#    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
#    NR==FNR{a[$1]          # hash $1 of genes file to a
#    next
#}
#($1 in a) {                # lookup from transcriptome
#    print
#}' selected_snp_for_validation.txt sspace.final.scaffolds_database.txt > selected_snp_for_validation_with_sequences.txt


awk '
    # { sub(/\r$/,"") }    # uncomment to remove Windows style line-endings.
    NR==FNR{a[$1]          # hash $1 of genes file to a
    next
}
($1 in a) {                # lookup from transcriptome
    print
}' 3-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_upstream.gff 3-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene.gff > 3-V-620_cpg_count.txt_no_first_line_rearranged5.txt_EVM_combined_gene_MATCH_w_upstream.txt
