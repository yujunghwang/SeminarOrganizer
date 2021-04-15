#### remind the applied micro seminar in the afternoon

# set directory to current folder
rootdir <- dirname(getSourceEditorContext()$path)
setwd(rootdir)

# first check if there is any seminar scheduled today
source("setGmailConfig.R")

if (daysleft[ind]==0){

  msg_heading <- paste0("Dear all, \n\n")
  
  ### feel free to modify the email text body, msg_body
  msg_body <- paste0("This is a reminder that we have an applied micro seminar this afternoon at ", seminar_time,".\n\n")
  
  msg_body <- paste0(msg_body,"The zoom link for the seminar is \n",zoom_link,
  "\n\n The zoom link to meet the speaker one-to-one is \n",meeting_link,
  "\n\n You can see the one-to-one meeting schedule at \n",signup_link,
  "\n\n See you all soon!\n\n")
  
  msg_end <- paste0("Best,\n",organizer_name)
  
  msg <- paste0(msg_heading,msg_body,msg_end)
  
  ### set a correct receiver email address inside gm_to()
  emailmsg <- gm_mime() %>%
    gm_to(c(audience_email,speaker_email)) %>%
    gm_from(organizer_email) %>%
    gm_subject(paste0("Reminder : Today's applied micro seminar (",speaker_name,")")) %>%
    gm_text_body(msg)
  
  ### send an email
  gm_send_message(emailmsg)
  
}

