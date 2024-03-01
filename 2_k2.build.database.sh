#!/bin/bash
# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 60
#SBATCH --mem=800g
#SBATCH -N 1
#SBATCH --mail-user=deflami2@illinois.edu
#SBATCH -D /home/labs/malhi_lab/paleogenomics/data/kraken_databases/
#SBATCH --mail-type=ALL
#SBATCH -J Kraken2DatabaseBuildlionhair
# ----------------Load Modules--------------------
module load Kraken2/2.1.1-IGB-gcc-8.2.0
# ----------------Commands------------------------
 unset OMP_NUM_THREADS
 kraken2-build --build --fast-build --threads 60 --db nt_only
