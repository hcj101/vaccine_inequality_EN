# Vaccine_SII_England
Repository for replicating analyses from the paper: Inequalities in childhood vaccine uptake: a longitudinal analysis of national coverage in England 2019-23 
Pre-print is available here https://www.medrxiv.org/content/10.1101/2024.02.03.24301936v1

All the data needed to produce these analyses are available from public sources

The cover of vaccination evaluated rapidly (COVER) programme provides GP level data on paediatric vaccines. We combined and clearen quarterly vaccine data from the below source, the combining of quarterly data process was largely manual and not included in the code:
https://www.gov.uk/government/collections/vaccine-uptake#cover-of-vaccination-evaluated-rapidly-programme

lookup file for Local authorities to regional health geographies
original source file from https://digital.nhs.uk/services/organisation-data-service/export-data-files/csv-downloads/non-nhs-organisations - file name lauth.csv
LAReg <- read_csv("M:/Documents/Teaching/Students/MPH Aidan Flatt/Vaccine inequalities in England/Vaccine inequalities in England/GP deprivation data/lauth.csv")

GP level Socio-economic Deprivation data
original source of data Office for Health Improvement & Disparities.  https://fingertips.phe.org.uk/search/deprivation
