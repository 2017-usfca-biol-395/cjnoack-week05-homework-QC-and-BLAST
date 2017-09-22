#!/bin/bash

# The script is a bash fastq sequence processing script which will create a 
# pipeline from data from NCBI to the command line using BLAST. From there, the 
# script will identify top matches in the GenBank nucleotide database. 

# Chelsea Noack
# cjnoack@tule.usfca.edu
# Created: September 22, 2017, Modified: September 22, 2017

# The following line ensures the programs will work by checking to see if there is 
# a value for the variable BLASTDB. If there isn't, it will set the appropriate 
# variables

if [ -z ${BLASTDB} ]; then source /home/.bashrc; export PATH; export BLASTDB; fi

# This line will downloads the list of files from the run table into the raw data 
# directory. The pipe and tail -n +2 is a handy way to exclude the first line

for SRA_number in $(cut -f 6 data/metadata/fierer_forensic_hand_mouse_SraRunTable.txt | tail -n +2)
do
    fastq-dump -v $SRA_number -O data/raw_data
done

# This line creates QC reports for each of the runs using the FASTQC program

fastqc data/raw_data/*.fastq --outdir=output/fastqc

# This for loop will trim the individual sequences based on their quality 
# scores. Sets parameters for leading and trailing Ns, discards sequences 
# below 150 base pairs, and uses a sliding window average method to cut off 
# reads when the base score is below 25.

# Info on the Trimmomatic tool available here: 
# http://www.usadellab.org/cms/index.php?page=trimmomatic

for file in $@

TrimmomaticSE -threads 2 -phred33 data/raw_data/ERR1942280.fastq data/trimmed/$(basename -s .fastq ERR1942280.fastq).trim.fastq LEADING:5 TRAILING:5 SLIDINGWINDOW:8:25 MINLEN:150



