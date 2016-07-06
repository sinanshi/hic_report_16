0. abstract

1. Road map: from ICIP and MEDICA XML to research ready data.

1. What are the benefits of RSD involvement.
  * Open source.
  * Business readable - data driven, yaml. 
  * Sustainability  - testings, documentation, CRAN format
  * cross platform. 


Report 
The critical care patient data sitting in the NHS trusts
across the UK will be the cornerstone many future medical and health services
research. Data is the undoubtable the most valuable asset in researches of this
kind, however there is still a huge gap between the data and the research. We
are facing the 

The RSDG was brought up to the project with the mission of bridging the gap by
providing open source software solutions. 


The
RSDG started getting involved in this project from February 2016 with the
mission of bridging this gap by providing sustainable readable software
interface. 

There is a crucial step from the data to research which is the software that
Critical care research modelling activities 

* the workflow
# The Road Map of Critical Care: from XML files to research available data.


# what have we done?
* R XML parser
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

* Data validation check and report
  Data validation and cleaning functions has been incorporated in the ccdata
  package. Data sanity check is conducted in many aspects regarding to the
  intrinsic property of the data. We look at the range, category, and the
  missingness of the data and conduct data cleaning process accordingly. Based
  on the data sanity check and the user specification, we are able to tell the
  user which data do not make sense or can not meet the requirement of the
  analysis. Subsequently, users will be able to generate the clean table for
  their research. In the following data cleaning configuration example, we
  presented three different filters for the item heart rate. We call each
  criterion filters. 
   
```
  NIHR_HIC_ICU_0108:
    shortName: hrate
    dataItem: Heart rate
    distribution: normal
    decimal_places: 0
    nodata:
      apply: drop_episode
    range:
        labels:
            red: (0, 300)
            amber: (0, 170) 
            green: (50, 100)
        apply: drop_entry
    missingness:
        labels:
            red: 12
            amber: 1
        accept_2d:
            yellow: 70 
  apply: drop_episode 
```
  



* Research ready tables
  ccRecord is a low level query-able format. The following step is to derive
  the research ready data. It is important to have 


* Auto-generating data quality report (ccreport)

* export to CSV 
* The Pipeline (ccdata)


