#!/bin/bash

# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH --mem=160g
#SBATCH -N 1
#SBATCH --mail-user deflami2@illinois.edu
#SBATCH -D /home/labs/malhi_lab/paleogenomics/data/kraken_databases
#SBATCH --mail-type ALL
#SBATCH -J K2_db_library_lionhair


# ----------------Load Modules--------------------
module load Kraken2/2.1.1-IGB-gcc-8.2.0 
# ----------------Commands------------------------

unset OMP_NUM_THREADS
kraken2-build --download-taxonomy --db nt_only
kraken2-build --download-library nt --db nt_only


