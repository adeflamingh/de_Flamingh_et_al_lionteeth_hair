#!/bin/bash

# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 48
#SBATCH --mem=800g
#SBATCH -N 1
#SBATCH -D /home/labs/malhi_lab/paleogenomics/deflami2/lionhair/kraken2
#SBATCH --mail-user deflami2@illinois.edu
#SBATCH --mail-type ALL
#SBATCH -J kraken_classify_liohair

# ----------------Load Modules--------------------
module purge
module load Kraken2/2.1.1-IGB-gcc-8.2.0 
# ----------------Commands-----------

sample_names=$(cat sample_list.txt) 

for sample in $sample_names
do
    kraken2 --db /home/labs/malhi_lab/paleogenomics/data/kraken_databases/nt_only --threads 48 --confidence 0.1 --report ${sample}_k2_report.txt  --output ${sample}k2_output.txt  ../pipeline_analysis/data/${sample}.fastq 
done



