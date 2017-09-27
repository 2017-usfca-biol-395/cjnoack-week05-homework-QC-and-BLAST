#!/bin/bash

# The script is a bash fastq sequence processing script which will create a 
# pipeline from data from NCBI to the command line using BLAST. From there, the 
# script will identify top matches in the GenBank nucleotide database. 

# Chelsea Noack
# cjnoack@tule.usfca.edu
# Created: September 22, 2017, Modified: September 22, 2017

# The following line ensures the programs will work by checking to see if there is 
# a value for the variable BLASTDB. If there isn't, it will set the appropriate 
# variablesd

if [ -z ${BLASTDB} ]; then source /home/.bashrc; export PATH; export BLASTDB; fi

# This line will downloads the list of files from the run table into the raw data 
# directory. The pipe and tail -n +2 is a handy way to exclude the first line

echo "Downloading files..."
for SRA_number in $(cut -f 6 data/metadata/fierer_forensic_hand_mouse_SraRunTable.txt | tail -n +2)
do
    fastq-dump -v $SRA_number -O data/raw_data
done
echo "Done!"

# This line creates QC reports for each of the runs using the FASTQC program

echo "Creating QC reports for each file"
fastqc data/raw_data/*.fastq --outdir=output/fastqc
echo "Done!"

# This for loop will trim the individual sequences based on their quality 
# scores. Sets parameters for leading and trailing Ns, discards sequences 
# below 150 base pairs, and uses a sliding window average method to cut off 
# reads when the base score is below 25.
# Info on the Trimmomatic tool available here: 
# http://www.usadellab.org/cms/index.php?page=trimmomatic

# First, make a directory to put the trimmed sequences

echo "Making directory for trimmed sequences"
mkdir data/trimmed
echo "Done!"

# Trimming sequences using a for loop

for file in data/raw_data/*.fastq
do
	TrimmomaticSE -threads 2 -phred33 $file data/trimmed/$(basename -s .fastq $file).trim.fastq LEADING:5 TRAILING:5 SLIDINGWINDOW:8:25 MINLEN:150
done

# Converting sequences from FASTQ to FASTA

echo "Converting our trimmed, fastq files into fasta..."
for file in data/trimmed/*.trim.fastq
do
	bioawk -c fastx '{print ">"$name"\n"$seq}' $file > data/trimmed/$(basename -s .fastq $file).fasta
done
echo "Done!"

# This line will BLAST each sequence and find the top match against the nucleotide database. What will output 
# will be a csv file called blast_results.csv. 

# options and what they're for:
# -db sets which database to use, in this case the nucleotide database
# -num_threads is how many different processor threads to use
# -outfrmt is the output format, further info available here:
# https://www.ncbi.nlm.nih.gov/books/NBK279675/
# -o is the filename to save the results in
# -max_target_seqs is the number of matches ot return for each query
# -negative_gilist tells BLAST which sequences to exclude from matches
# This cuts down on the number of uncultured or environmental matches
# -query is the fasta file of sequences we want to search for matches to

# Make directory for the BLAST output first
echo "Making subdirectory for BLAST..."
mkdir output/blast
echo "Done!"

# BLAST
echo "Putting files through BLAST..."
for file in data/trimmed/*.trim.fasta
do
	blastn -db /blast-db/nt -num_threads 2 -outfmt '10 sscinames std' -out output/blast/$(basename -s .fasta $file).blast_results.csv -max_target_seqs 1 -negative_gilist /blast-db/2017-09-21_GenBank_Environmental_Uncultured_to_Exclude.txt -query $file
done
echo "Done!"

