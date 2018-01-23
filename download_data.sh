#!/bin/bash

# czi-cancer-data
# 2018 Gregory Way

# Script to download gene expression and covariate data from 4 single cell gene
# expression analyses. The script will fetch, decompress, and rename each data set
# listed below

mkdir --parents data/raw

# Patel et al. 2014
wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE57nnn/GSE57872/suppl/GSE57872_GBM_data_matrix.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE57nnn/GSE57872/matrix/GSE57872_series_matrix.txt.gz
gunzip -c GSE57872_GBM_data_matrix.txt.gz > data/raw/GSE57872_data.txt
gunzip -c GSE57872_series_matrix.txt.gz > data/GSE57872_samples.txt
rm *.gz

# Sottoriva et al. 2013
wget http://www.ebi.ac.uk/arrayexpress/files/E-MTAB-1129/E-MTAB-1129.raw.1.zip
wget http://www.ebi.ac.uk/arrayexpress/files/E-MTAB-1129/E-MTAB-1129.sdrf.txt
unzip E-MTAB-1129.raw.1.zip 
mv Genomestudio-GBMrawdata.txt data/raw/E-MTAB-1129_data.txt
mv E-MTAB-1129.sdrf.txt data/E-MTAB-1129_samples.txt

# Meyer et al. 2015
wget http://www.ebi.ac.uk/arrayexpress/files/E-MTAB-2693/E-MTAB-2693.raw.1.zip
wget http://www.ebi.ac.uk/arrayexpress/files/E-MTAB-2693/E-MTAB-2693.sdrf.txt
unzip E-MTAB-2693.raw.1.zip -d data/raw/E-MTAB-2693
mv E-MTAB-2693.sdrf.txt data/E-MTAB-2693_samples.txt
rm *.zip*

# Venteicher et al. 2017
# Astrocytoma Data
wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE89nnn/GSE89567/suppl/GSE89567_IDH_A_processed_data.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE89nnn/GSE89567/matrix/GSE89567_series_matrix.txt.gz
gunzip -c GSE89567_IDH_A_processed_data.txt.gz > data/raw/GSE89567_data.txt
gunzip -c GSE89567_series_matrix.txt.gz > data/GSE89567_samples.txt

# Oligodendroglioma Data
wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE70nnn/GSE70630/suppl/GSE70630_OG_processed_data_v2.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE70nnn/GSE70630/matrix/GSE70630_series_matrix.txt.gz
gunzip -c GSE70630_OG_processed_data_v2.txt.gz > data/raw/GSE70630_data.txt
gunzip -c GSE70630_series_matrix.txt.gz > data/GSE70630_samples.txt
rm *.gz
