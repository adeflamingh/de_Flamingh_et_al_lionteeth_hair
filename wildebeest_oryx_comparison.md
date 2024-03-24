##step 1: get read list from wildebeest.bam and oryx bam (i.e. the read names of reads that mapped to wildebeest and oryx mitogenomes)
~~~
module load SAMtools
samtools view mt_Bovidae_wildebeest/results/finalResult-bowtie2dedup/Alida_Tsavo_H6_AGACCTTG-TTACGTGC_L001_R1_001.ready.bam | cut -f1 | sort | uniq > read_names_wildebeest.txt
samtools view mt_Bovidae_oryx/results/finalResult-bowtie2dedup/Alida_Tsavo_H6_AGACCTTG-TTACGTGC_L001_R1_001.ready.bam | cut -f1 | sort | uniq > read_names_oryx.txt
~~~
##step 2: filter wildebeest.bam to exclude any reads that also map to oryx (i.e. get reads that uniquely map to wildebeest and not to oryx)
~~~
module load picard/2.10.1-Java-1.8.0_152 
picard FilterSamReads I=mt_Bovidae_wildebeest/results/finalResult-bowtie2dedup/Alida_Tsavo_H6_AGACCTTG-TTACGTGC_L001_R1_001.ready.bam O=wildebeest_unique.bam READ_LIST_FILE=read_names_oryx.txt FILTER=excludeReadList
~~~
##step 3: filter oryx.bam to exclude any reads that also map to wildebeest (i.e. get reads that uniquely map to oryx and not to wildebeest)
~~~
picard FilterSamReads I=mt_Bovidae_oryx/results/finalResult-bowtie2dedup/Alida_Tsavo_H6_AGACCTTG-TTACGTGC_L001_R1_001.ready.bam O=oryx_unique.bam READ_LIST_FILE=read_names_wildebeest.txt FILTER=excludeReadList
~~~
##step 4: convert wildebeest_unique.bam and oryx_unique.bam each to a fastq file so that they can be searched for using BLASTn
~~~
module load seqtk/1.3-IGB-gcc-8.2.0
samtools bam2fq wildebeest_unique.bam > wildebeest_unique.fastq
seqtk seq -a wildebeest_unique.fastq > wildebeest_unique.fasta

samtools bam2fq oryx_unique.bam > oryx_unique.fastq
seqtk seq -a oryx_unique.fastq > oryx_unique.fasta
~~~
##step 5: blast each or fasta files and save only top hit (and taxon id)
~~~
module load ncbi-blastdb/20230124
module load BLAST+
blastn -db nt -query wildebeest_unique.fasta -outfmt '6 qseqid staxids sscinames scomnames sskingdoms stitle' -out wildebeest_uniq_blastn -max_target_seqs 1 -max_hsps 1
blastn -db nt -query oryx_unique.fasta -outfmt '6 qseqid staxids sscinames scomnames sskingdoms stitle' -out oryx_uniq_blastn.tsv -max_target_seqs 1 -max_hsps 1
~~~
