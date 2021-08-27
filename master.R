# master 
### I will run this code in Windows
### If you want to run this code in Mac, use the package "cronR"

# load libraries
#install.packages(taskscheduleR)
library(taskscheduleR)
library(gmailr)
library(googlesheets4)
library(rstudioapi)

# set directory to current folder
rootdir <- dirname(getSourceEditorContext()$path)
setwd(rootdir)


### I recommend to check first whether you can run the following configuration without any errors
source("setGmailConfig.R")


### our applied micro seminar is every Wednesday


# ask for a paper title from next speaker, run every Thursday
taskscheduler_create(
  taskname="ask_speaker",
  rscript=paste0(rootdir,"/askSpeaker.R"),
  schedule="WEEKLY",
  starttime="06:00",
  startdate="08/26/2021",
  days="THU",
  Rexe=file.path(Sys.getenv("R_HOME"),"bin","Rscript.exe")
)

# circulate a sign up sheet and announce the next seminar every Friday
taskscheduler_create(
  taskname="ask_signup",
  rscript=paste0(rootdir,"/askSignup.R"),
  schedule="WEEKLY",
  starttime="06:00",
  startdate="08/27/2021",
  days="FRI",
  Rexe=file.path(Sys.getenv("R_HOME"),"bin","Rscript.exe")
)

# send a reminder for a seminar every Tuesday evening
taskscheduler_create(
  taskname="send_reminder",
  rscript=paste0(rootdir,"/remindSeminar.R"),
  schedule="WEEKLY",
  starttime="18:00",
  startdate="08/30/2021",
  days="TUE",
  Rexe=file.path(Sys.getenv("R_HOME"),"bin","Rscript.exe")
)

### Stop running the code by running the following lines after the semester ends
# taskscheduler_stop("ask_speaker")
# taskscheduler_delete("ask_speaker")
# taskscheduler_stop("ask_signup")
# taskscheduler_delete("ask_signup")
# taskscheduler_stop("send_reminder")
# taskscheduler_delete("send_reminder")
