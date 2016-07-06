% Critical Care Project Report
% Research Software Development Group
% 7th July 2016

\newpage
# Introduction
The critical care patient data sitting in the NHS trusts
across the UK will be the cornerstone many future medical and health services
research. Data is the undoubtable the most valuable asset in researches of this
kind, however there is still a huge gap between the data and the research. We
are facing the 

The RSDG was brought up to the project with the mission of bridging the gap by
providing open source software solutions. 


The RSDG started getting involved in this project from February 2016 with the
mission of bridging this gap by providing sustainable readable software
interface. 

There is a crucial step from the data to research which is the software that
Critical care research modelling activities 



# The Data Process Pipeline
## Anonymised and identifiable data
sdf dsgsd dfgd 

## XML parser
The XML files are given in both deidentified and identifiable form
associated with more than 10000 patients and 5 trusts. The XML parser
combines and restructures the XML files into a newly defined R data
structure ccRecord, which significantly improved the clarity of the data by
organising data under tables and removing the redundancy of the XML files.
ccRecord is designed as a flexible, simplified, and query-able data
structure for critical care data. Data in ccRecord format will be
eventually stored in an RData file which is about 500 times smaller than
that of the XML files. In addition the data provenance is recored by each
episode. Hence we will be able to tell where each episode data comes from
and when it has been parsed.

## Auto-generated quality report
sdf  sf


## Data validation and cleaning
Data validation and cleaning functions has been incorporated in the ccdata
package. Data sanity check is conducted in many aspects regarding to the
intrinsic property of the data. We look at the range, category, and the
missingness of the data and conduct data cleaning process accordingly. Based on
the data sanity check and the user specification, we are able to tell the user
which data do not make sense or can not meet the requirement of the analysis.
Subsequently, users will be able to generate the clean table for their
research. 

## Selection and cleaning yaml configuration
Here is an example of the yaml data cleaning configuration of heart
rate, in which three filters __nodata__, __range__, __missingness__ are
presented in the following data cleaning configuration for heart rate. The yaml
form is straight forward and self-explanatory for non-programmers. 
```Python
NIHR_HIC_ICU_0108:
  shortName: hrate
  dataItem: Heart rate
  distribution: normal
  decimal_places: 0

  # filter1: do not use the episode where hrate cannot be found.
  nodata:     
     apply: drop_episode

  # filter2: mark all the values based on reference range (traffic colour) remove entries where the range check is not fullfilled.  
  range:  
      labels:
          red: (0, 300)
          amber: (0, 170) 
          green: (50, 150)
      apply: drop_entry

  # filter3: compute the item missing rate on given cadences; in this case, we compute the daily (red) and hourly (amber) missing rate, and only accpet episodes of which hourly missing rate (amber) is lower than 30%. 
  missingness: 
      labels:
          red: 24
          amber: 1
      accept_2d:
          amber: 70 
  apply: drop_episode 
```
# ccdata R package
## software development
* reusable
* tested 
* documented
* effortless installation, cross platform - windows, unix so we can share
## examples

# Summary
wrap up

