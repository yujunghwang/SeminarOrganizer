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

Next, you should set up Gmail API and Google Sheet API to allow R to
access your gmail account. You should read instructions in the following
website.

<https://github.com/r-lib/gmailr> <https://googlesheets4.tidyverse.org/>

Finally, you should set basic parameters in setGmailConfig.R code file.
I recommend creating the seminar schedule table and one-to-one meeting
signup table on Google spreadsheet.

The code will read google spreadsheets and retrieve the seminar schedule
information.

The code is set to run on the same day every week, and if there is no
seminar scheduled within the next seven days, the code will skip sending
the emails in that week.

The ‘master.R’ code is composed of three parts. I assumed the weekly
seminar is scheduled on every Wednesday (you can change the days you
want to send each email).

The first part is to send an email to the next seminar speaker to ask
about the paper title, if the paper title is not already updatd on the
seminar schedule spreadsheet.

The second part is to send an email to the seminar audience to circulate
the one-to-one meeting sign up sheet.

The third part is to remind about the seminar on the seminar date.

``` r
# ask for a paper title from next speaker, run every Thursday
taskscheduler_create(
  taskname="ask_speaker",
  rscript=paste0(rootdir,"/askSpeaker.R"),
  schedule="WEEKLY",
  starttime="10:00",
  startdate="04/15/2021",
  days="THU",
  Rexe=file.path(Sys.getenv("R_HOME"),"bin","Rscript.exe")
)

# circulate a sign up sheet and announce the next seminar every Friday
taskscheduler_create(
  taskname="ask_signup",
  rscript=paste0(rootdir,"/askSignup.R"),
  schedule="WEEKLY",
  starttime="06:00",
  startdate="04/16/2021",
  days="FRI",
  Rexe=file.path(Sys.getenv("R_HOME"),"bin","Rscript.exe")
)

# send a reminder for a seminar every Wednesday
taskscheduler_create(
  taskname="send_reminder",
  rscript=paste0(rootdir,"/remindSeminar.R"),
  schedule="WEEKLY",
  starttime="06:00",
  startdate="04/21/2021",
  days="WED",
  Rexe=file.path(Sys.getenv("R_HOME"),"bin","Rscript.exe")
)
```

CAVEAT : You can close the Rstudio after you run the “master.R” code
once. However, you should not turn off your computer. Otherwise, the
code may fail to send emails on time. I recommend running this code on
your cloud computing server, which runs 24/7.

After the semester, you can stop and delete the scheduled automation by
running the following lines.

``` r
taskscheduler_stop("ask_speaker")
taskscheduler_delete("ask_speaker")
taskscheduler_stop("ask_signup")
taskscheduler_delete("ask_signup")
taskscheduler_stop("send_reminder")
taskscheduler_delete("send_reminder")
```
