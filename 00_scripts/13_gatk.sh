r/bin/env bash
#PBS -q omp
#PBS -l walltime=96:00:00
#PBS -l mem=100g
#PBS -l ncpus=12

# java -jar <path to GenomeAnalysisTK.jar> -T CountReads -R exampleFASTA.fasta -I exampleBAM.bam
# where -T CountReads specifies which analysis tool we want to use, -R exampleFASTA.fasta specifies the reference sequence, 
# and -I exampleBAM.bam specifies the file of aligned reads we want to analyze.

# -T for the tool name, which specifices the corresponding analysis
# -R for the reference sequence file
# -I for the input BAM file of aligned reads

# HaplotypeCaller = Call germline SNPs and indels via local re-assembly of haplotypes

# -ploidy = Ploidy per sample. For pooled data, set to (Number of samples in each pool * Sample Ploidy).

WORKING_DIRECTORY=/home1/scratch/plstenge/gatk
ASSEMBLY=/home1/datawork/plstenge/Pearl_Oyster_Colour_Population_Genomics/01_data/sspace.final.scaffolds.fasta
GATK=". /appli/bioinfo/gatk/latest/env.sh" # version 4.0.2.1-0

cd $WORKING_DIRECTORY
$GATK
# java -jar <path to GenomeAnalysisTK.jar> -T CountReads -R $ASSEMBLY -I pool1.bam pool2.bam

   java -jar GenomeAnalysisTK.jar \
     -R $ASSEMBLY \
     -T HaplotypeCaller \
     -I pool1.bam [-ploidy 14] \
     -I pool2.bam [-ploidy 22] \
     [--dbsnp dbSNP.vcf] \
     [-stand_call_conf 30] \
     [-L targets.interval_list] \
     -o output.raw.snps.indels.vcf
