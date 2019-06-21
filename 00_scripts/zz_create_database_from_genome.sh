awk 'ORS = $1 ~ /A/ ? " " : "\n"' sspace.final.scaffolds.fasta > sspace.final.scaffolds_database_awk.txt
awk 'ORS = $1 ~ /T/ ? " " : "\n"' sspace.final.scaffolds_database_awk.txt > sspace.final.scaffolds_database_awk_2.txt
rm sspace.final.scaffolds_database_awk.txt 
awk 'ORS = $1 ~ /C/ ? " " : "\n"' sspace.final.scaffolds_database_awk_2.txt > sspace.final.scaffolds_database_awk_3.txt
rm sspace.final.scaffolds_database_awk_2.txt 
awk 'ORS = $1 ~ /G/ ? " " : "\n"' sspace.final.scaffolds_database_awk_3.txt > sspace.final.scaffolds_database_awk_4.txt
rm sspace.final.scaffolds_database_awk_3.txt 
awk 'ORS = $1 ~ /N/ ? " " : "\n"' sspace.final.scaffolds_database_awk_4.txt > sspace.final.scaffolds_database_awk_5.txt
rm sspace.final.scaffolds_database_awk_4.txt 
sed 's/N /N/g' sspace.final.scaffolds_database_awk_5.txt > sspace.final.scaffolds_database_awk_6.txt
rm sspace.final.scaffolds_database_awk_5.txt 
sed 's/A /A/g' sspace.final.scaffolds_database_awk_6.txt > sspace.final.scaffolds_database_awk_7.txt
rm sspace.final.scaffolds_database_awk_6.txt 
sed 's/C /C/g' sspace.final.scaffolds_database_awk_7.txt > sspace.final.scaffolds_database_awk_8.txt
rm sspace.final.scaffolds_database_awk_7.txt 
sed 's/T /T/g' sspace.final.scaffolds_database_awk_8.txt > sspace.final.scaffolds_database_awk_9.txt
rm sspace.final.scaffolds_database_awk_8.txt 
sed 's/G /G/g' sspace.final.scaffolds_database_awk_9.txt > sspace.final.scaffolds_database_awk_10.txt
rm sspace.final.scaffolds_database_awk_9.txt 
sed 's/>/\n>/g' sspace.final.scaffolds_database_awk_10.txt > sspace.final.scaffolds_database.txt
rm sspace.final.scaffolds_database_awk_10.txt 
