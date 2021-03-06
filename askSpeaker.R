# email to a seminar speaker to ask a paper title / paper copy
# load libraries
library(gmailr)
library(googlesheets4)

# set directory to current folder
rootdir <- "C:/Users/yhwang18/Dropbox/Document/GitHub/SeminarOrganizer"
setwd(rootdir)

# first check if there is any seminar scheduled within the next 10 days & if paper title is empty
source("setGmailConfig.R")

# if there is a seminar scheduled within the next 7 days, send an email to the speaker to ask the paper title and the draft
if (daysleft[ind]<=7 & daysleft[ind]>=1 & is.na(seminar_schedule$PaperTitle[ind])){
  

  msg_heading <- paste0("Dear Professor ",speaker_name,", \n\n")
  
  ### feel free to modify the email text body, msg_body
  msg_body <- "Hope this email finds you well. Your scheduled seminar is in about a week from now. \nIf you haven't sent it already, can you please send me your paper title (and your paper copy if it is available) at your earliest convenience? \nThank you for giving a seminar at our department and we will look forward to meeting you soon.\n\n"
  
  msg_end <- paste0("Best,\n",organizer_name)
  
  msg_note <- "\n\n----------\n\nNote : This email was automatically generated by a program. \nPlease excuse the brevity and any errors. Thanks.\n"
  
  
  msg <- paste0(msg_heading,msg_body,msg_end,msg_note)
  
  ### set a correct receiver email address inside gm_to()
  emailmsg <- gm_mime() %>%
    gm_to(paste0(speaker_email,",",organizer_email)) %>%
    gm_from(organizer_email) %>%
    gm_subject("JHU Applied Micro Seminar Paper Title") %>%
    gm_text_body(msg)
  
  ### send an email
  gm_send_message(emailmsg)
  
}