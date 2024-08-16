# de_Flamingh_et_al_lionteeth_hair

This respository contains the bioinformatic code associated with the publication:
## Title: Compacted hairs in broken teeth reveals prey diet of historic lions
Authors: Alida de Flamingh1,9,10, Thomas P. Gnoske2,10, Julian C. Kerbis Peterhans2,3, Velizar A. Simeonovski2, Nduhiu Gitahi4, Ogeto Mwebi5, Bernard R. Agwanda5, Julian M. Catchen1,6, Alfred L. Roca1,7 & Ripan S. Malhi1,8

Affiliations:
1 Carl R. Woese Institute for Genomic Biology, University of Illinois, Urbana IL, 61801, USA
2 Field Museum of Natural History, Chicago Il 60605-2496, USA.
3 College of Arts & Sciences, Roosevelt University, Chicago, IL, 60605-1394, USA. 
4 Department of Public Health, Pharmacology and Toxicology, University of Nairobi, Kenya. 
5 Department of Osteology, National Museums of Kenya, Kenya. 
6 Department of Ecology, Evolution, and Behavior, UIUC, Urbana IL, 61801, USA
7 Department of Animal Sciences, UIUC, Urbana IL, 61801, USA
8 Department of Anthropology, UIUC, Urbana IL, 61801, USA



Corresponding authors: 
*Alida de Flamingh, X: @adeflamingh, adeflamingh@gmail.com
**Ripan S. Malhi, X: @MalhiRipan, malhi@illinois.edu

## Code description:
1_k2.database.download.sh
Shell script for downloading the NCBI nt database taxonomy and data

2_k2.build.database.sh
Shell script for building the Kraken2 database using the data downloaded in step 1

3_k2.classify_SE.sh
Shell script for classifying the fastq reads (Single End in this case) using the database created in step 2

4.Molecular_Protocol.md 
Molecular protocol used to extract DNA from hair

5.Wildebeest_oryx_comparison.md
Methodological approach used to compare reads originating from oryx and wildebeest

