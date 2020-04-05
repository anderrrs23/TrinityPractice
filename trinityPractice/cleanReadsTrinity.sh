#! /bin/bash/
#Andi Johnson
#BIO435

#####################Part1#########################
#This script will download a fastq file, check raw read with fastqc,
#use Trimmomatic to clean reads, check cleaned reads with fastqc,
#and use Trinity to assemble transcripts

#This will download the SRA file from NCBI:
#in directory in which you would like to proceed:
#Originally tried this command, but with not success:"fastq-dump --gzip --split-files SRR8655915 &"
#I tried this one instead and it worked:

nohup fasterq-dump --split-files --gzip &
#Note that this did not create gzip files. Not sure as to why... but Trimmomatic still worked 

#This will check the raw read quality that was downloaded from NCBI:
#must check with the output ".html" using FileZilla to take you to FastQC site
 /opt/FastQC/fastqc SRR8655915_1.fastq
 /opt/FastQC/fastqc SRR8655915_2.fastq

#This will run Trimmomatic to trim the adapters off ofthe sequences

java -jar /opt/Trimmomatic-0.38/trimmomatic \
        PE \
        -phred33 \
        -threads 6 \
        SRR8655915_1.fastq.gz \
        SRR8655915_2.fastq.gz \
        clean_1.fastq.gz \
        unp_1.fastq.gz \
        clean_2.fastq.gz \
        unp_2.fastq.gz \
        ILLUMINACLIP:/opt/Trimmomatic-0.38/adapters/allAdapter.fas:2:30:10 \
        LEADING:30 \
        TRAILING:30 \
        HEADCROP:5 \
        SLIDINGWINDOW:5:30 \
        MINLEN:50

#Check clean reads quality with fastqc
/opt/FastQC/fastqc clean_1.fastq.gz
/opt/FastQC/fastqc clean_2.fastq.gz

#Run Trinity
#enter a tmux shell
/opt/trinity/Trinity --seqType fq --max_memory 50G --left clean_1.fastq.gz --right clean_2.fastq.gz --CPU 12 --SS_lib_type RF &

##################################PartII############################################################

#Next, we will run TransDecoder to annotate the outputed Trinity.fasta file

/opt/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs -t Trinity.fasta

#Finally, we will run a blast query to check the reads in SwissProt

blastp -query longest_orfs.pep -db /data/swissProt/uniprot_sprot.fasta -outfmt 6 -max_target_seqs 1 -num_threads 10 -evalue 1e-5 > trans.blast.tab
