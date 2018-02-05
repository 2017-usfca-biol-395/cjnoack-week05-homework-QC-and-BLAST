# The script will analyze a set of BLAST files which have already been trimmed, QC'ed, and put through BLAST. 

# Chelsea Noack
# cnoackj@gmail.com
# Created On: September 27, 2017; Last Modified: September 28, 2017

# The following will give us the first column for each sequence with a for loop.
# First we will make a seperate subdirectory for the parsed sequences
echo "Making directory for parsed sequences"
mkdir output/parsed
echo "Done!"

# Now we parse the data by name and % similarity
echo "Parsing data..."
for file in output/blast/*.trim.blast_results.csv
do
	cut -d, -f1,4 $file | uniq -c | sort -g > output/parsed/$(basename -s .trim.blast_results.csv $file).parsed_blast.txt
done
echo "Done!"
