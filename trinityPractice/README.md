# This is a readme for week4 assignment
# PartI Content List
cleanReadsTrinity.sh= bash file that runs the entirety of week4 (parts 1 and 2) 

SRR8655915_1.fastq.gz= Forward sequence of dumped file from SRA NCBI in gzipped form
SRR8655915_2.fastq.gz= Reverse sequence of the same SRA NCBI file in gzipped form

Trim.sh= bash script to run Trimmomatic program.

clean_1.fastq.gz= Clean forward reads from outputted Trimmomatic program.
clean_2.fastq.gz= Clean reverse reads from same output.

unp_1.fastq.gz= Unpaired forward reads from Trimommatic program.
unp_2.fastq.gz= Unpaired reverse reads from the same output.

SRR8655915_1_fastqc.html= FastQC output of the trimmed forward reads in html format to be able to check quality online. 
SRR8655915_2_fastqc.html= FastQC output of the trimmed reverse reads in html format to be able to check quality online.

Trinity.fasta.transdecoder_dir= directory created after running Trinity that contained all of the output files.
Trinity.fasta= only needed output from the Trinity program. This contains the assembed transcripts. 

Trinity.fasta.transdecoder_dir.__checkpoints_longorfs= directory created after using the TransDecoder program on the Trinity.fasta file
longest_orfs.cds= output from transdecoder that contains protein coding genes
longest_orfs.pep= has translated amino acid sequences given in a table. Same annotations as the .cds



# Part II
## Trinity output
The Trinity Assembly program is a RNA seq assembly software. We use a --SS lib type to put the genes in in 5'-3' order.
 The output shows all of the times that a 25bp sequence occurs uniquely. We only focus on the outputted file "Trinity.fasta".
## Transdecoder output
The transdecoder function is responsible for annotating the trinity output file (Trinity.fasta). 
It produces 3 files as outputs: longest_orfs.cds (annotated genes), longest_orfs.gff3 (gene location information),
 and longest_orfs.pep (translated amino acid sequence of the .cds file).
## Blast output
The output for this is in the file trans.blast.tab. The file contains the ORF name, 
hit name from Swissprot database, percent identity, gap presence, e-value, starting/ending position of query, and bit score. 

## Trinity
Number of trinity transcripts: 19007
## Trandecoder 
Number of ORFs detected: 9093
Number of complete ORFs: 1567
Number of  5’ partial ORFS: 2123
Number of  3’ partial ORFS: 750
Number of internal ORFS: 4653
## Blast output
Number of unique ORFs annotated: 18186
Number of unique annotations: 5895
Name and number of most common annotation: Q09666|AHNK_HUMAN (from SwissProt: Neuroblast differentiation-associated protein AHNK), 595 annotations

