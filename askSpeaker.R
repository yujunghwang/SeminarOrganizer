# email to a seminar speaker to ask a paper title / paper copy
# first check if there is any seminar scheduled within the next 10 days & if paper title is empty
source("setGmailConfig.R")

# if there is a seminar scheduled within the next 7 days, send an email to the speaker to ask the paper title and the draft
if (daysleft[ind]<=7 & daysleft[ind]>=1 & is.na(seminar_schedule$PaperTitle[ind])){
  
  msg_heading <- paste0("Dear Professor ",speaker_name,", \n\n")
  
  ### feel free to modify the email text body, msg_body
  msg_body <- "Can you please send me your paper title (and your paper copy if it is available) at your earliest convenience? \nI will look forward to meeting you soon at the JHU Applied Micro seminar.\n"
  
  msg_end <- paste0("Best,\n",organizer_name)
  
  msg <- paste0(msg_heading,msg_body,msg_end)
  
  ### set a correct receiver email address inside gm_to()
  emailmsg <- gm_mime() %>%
    gm_to(speaker_email) %>%
    gm_from(organizer_email) %>%
    gm_subject("JHU Applied Micro Seminar Paper Title") %>%
    gm_text_body(msg)
  
  ### send an email
  gm_send_message(emailmsg)
  
}