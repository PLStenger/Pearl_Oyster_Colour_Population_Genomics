#!/bin/bash

# Clean up
rm 00_scripts/datarmor_jobs/TRIM*sh

# launch scripts for Colosse
for file in $(ls DATADIRECTORY/*fastq.gz|perl -pe 's/.f(ast)?q.gz//'|sort -u)

do
	base=$(basename "$file")
	toEval="cat 00_scripts/02_trimmomatic_qs28.qsub | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/datarmor_jobs/TRIM_"$base".sh
done


#change jobs header

#Submit jobs
for i in $(ls 00_scripts/datarmor_jobs/TRIM*sh); do qsub $i; done
