README
================

## Introduction

This Github repository includes functions to automate sending emails to
the weekly seminar speakers and the audience.

You can set this up once at the beginning of the semester and forget
about sending an announcement / reminder throughout the semester \!

To use these functions, you should install relevant packages. The code
file calls the following R
packages.

``` r
library(taskscheduleR) ### use taskscheduleR on Windows, use cronR on Mac
library(gmailr)
library(googlesheets4)
library(rstudioapi)
```

Next, you should set up Gmail API to allow R to access your gmail
account. You should read instructions in the following website.

<https://github.com/r-lib/gmailr>

Finally, you should set basic parameters in setGmailConfig.R code file.
I recommend creating the seminar schedule table and one-to-one meeting
signup sheet on Google spreadsheet.

The code will read google spreadsheets and retrieve the seminar schedule
information.

The code is automated to run on the same day every week, and if there is
no seminar scheduled within the next seven days, the code will skip
sending the emails in that week.
