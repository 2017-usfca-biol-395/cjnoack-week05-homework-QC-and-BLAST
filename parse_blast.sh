# The script will analyze a set of BLAST files which have already been trimmed, QC'ed, and put through BLAST. 

# Chelsea Noack
# cnoackj@gmail.com
# Created On: September 27, 2017; Last Modified: September 27, 2017

# The following will give us the first column for each sequence with a for loop.

cut -d, -f1,4 output/blast/ERR1942280.trim.blast_results.csv | uniq -c | sort -g > output/blast/testparsedfile.txt
