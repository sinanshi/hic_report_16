% Critical Care Project Report
% Research Software Development Group
% 7th July 2016

\newpage
# Introduction
The critical care patient data will be the cornerstone of many future medical
and health services research. However, the raw data needs to be converted into
a research-ready structure to enable and ease its scientific analysis.
Thus, to cover that gap the data has to be transformed into a queryable form
and its properties and quality to be understood. 
The UCL Research Software Development Group's mission 
is to provide an open source software solution to
bridge this gap and deliver the ready-to-use data alongside with the data
manipulation tools for the researchers. 

We have built a pipeline which converts the `XML` raw data to the queryable RData format.
Additionally enabling to export the resultant data into `CSV` format to
be used outside R (_e.g._, with Excel). 
A business readable data quality check dictionary is used in the pipeline to 
clean the data. The non-validated data is
either modified or removed according to the such criteria. Subsequently, an
auto-generated data quality report is produced to report the key fields
missingness and data sanity by each site and unit. By the end of the pipeline the
researchers obtain a R table which is queryable and
validated. We also have demonstrated the ability of deriving data products, such as
SOFA score from physiology data and identification of sepsis. A publication 
about this process is in due course.

We believe a robust, understandable and accessible software is
the first step of solid research. Therefore, beyond the functionalities, 
we focus in the usability and sustainability of
the software produced. All of our development is constantly updated in the
GitHub platform which is accessible to all the allowed users.  The installation process of
our software aims to simplicity. The code is self-explanatory and well
documented providing accessibility to the  (empowering?) users and future
developers. Testings are conducted after any modification of code automatically
on the Travis CI system. Overall this ensures the software to be a gateway to the data which
plays a critical role in the future success of the community.

# The Data Process Pipeline
![The Data Process Pipeline](pipeline.png)

## The XML data and the Data Safe Haven
Data associated with more than 12,000 patients from 5 NHS trusts are available
in XML format. The data were drawn from the ICIP and Medicuse database which
contains demographic, drugs, laboratory, nursing and physiology data. The
de-identifiable data are processed locally and the identifiable data is on the
UCL Data Safe haven (IDHS).  In order to create the pipeline of on IDHS, we
ordered and configured a UNIX virtual environment. Due to the limit capacity of
IDHS, it is still useful to keep a local de-identifiable copy for development
purpose. Our pipeline is designed to be portable on multiple platforms. It can be
executed on both local environments and IDHS with de-identifiable and
identifiable data respectively. 

## XML parser

The XML parser combines and restructures the XML files into a newly defined R
data structure `ccRecord`, which significantly improved the clarity of the
data by organising data under tables and removing the redundancy of the XML
files.  __ccRecord__ is designed as a flexible, simplified, and query-able data
structure for critical care data. Data in __ccRecord__ format will be eventually
stored in a RData file which is about 500 times smaller than that of the XML
files.  In addition the data provenance is recored by each episode, henceforth
we will be able to tell which file does each episode data comes from and when
it has been parsed. The selected data fields can be exported as a CSV file for
the Excel users. - and other programming languages

## Auto-generated quality report
Data can have defects in many different ways. Therefore a synthetic quality
assessment which may allow us to report back to the source of the data can be
extremely useful. An automatic generated data quality report which reflects to
quality issues have been developed. Based on the report, we will be able to
tell the major missingness issues and some data sanity issues and the basic
information such as the duration, sites, number of episodes, and number of
patient.

## Data validation and cleaning
Data validation and cleaning functions have been incorporated in the ccdata
package. Data sanity check is conducted in many aspects regarding to the
intrinsic property of the individual fields. There are three major validation,
the numeric range, the text category, and the missingness. The users are
required to fill a `yaml` form to guide the validation check. We
will be able to flag the level of the data sanity and opt out the data that do
not make sense or inform the users according to the yaml dictionary. We will
again go through the yaml dictionary in the next session. After this stage, 
we are able to deliver a "cleaned" and query-able R table to the researchers.


# The R package: ccdata
The main part of the pipeline can be performed by the functions in the R
package ccdata. A package bundles all code, documentation and tests together,
which makes the code sharing easy. ccdata is portable in almost all platforms
where R environment is provided. It can be installed effortlessly on Windows or
Unix based systems. Although it is necessary to have some further tidy-ups in
the subsequent development cycle, in current stage, the main part of the R code
is well documented and properly tested which are the keys of code robustness
and usability. 


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



# Summary
wrap up

