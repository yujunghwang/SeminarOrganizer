### announce the next applied micro seminar and circulate the sign up sheet

# set directory to current folder
rootdir <- dirname(getSourceEditorContext()$path)
setwd(rootdir)

# first check if there is any seminar scheduled within the next 7 days
source("setGmailConfig.R")

if (daysleft[ind]<7 & daysleft[ind]>=1){
  
  # update the sign up sheet to a blank page
  range_clear(signup_link,range="B4:B13")
  range_clear(signup_link,range="A2:B2")
  
  signuphead=as.data.frame(cbind(paste0(speaker_name," sign up"),paste0("Date : ",seminar_date)))
  colnames(signuphead)=NULL
  range_write(signup_link,data=signuphead,range="A1")
  
  # compose a group email
  msg_heading <- paste0("Dear all, \n\n")
  
  ### feel free to modify the email text body, msg_body
  msg_body <- paste0(speaker_name," from ",speaker_institution, " will be our next seminar speaker.\n")
  
  if (!is.na(paper_title)){
    msg_body <- paste0(msg_body,"The speaker will present '", paper_title, "' on ", seminar_date," at ", seminar_time, ".\n\n")
  }
  
  if (!is.na(paper_link)){
    msg_body <- paste0(msg_body,"You can find the draft in the following link.\n",paper_link,"  \n\n")
  }
  
  msg_body <- paste0(msg_body,"Faculties can sign up for the one-to-one meeting slot in the following link.\n",signup_link,
                     "\n Graduate students can sign up after ",grad_signup_time,".\n\n",
                     "The zoom link for the seminar is\n",zoom_link,"\n\n",
                     "The zoom link to meet the speaker one-to-one is \n",meeting_link,"\n\n")
  
  msg_end <- paste0("Best,\n",organizer_name)
  
  msg <- paste0(msg_heading,msg_body,msg_end)
  
  ### set a correct receiver email address inside gm_to()
  emailmsg <- gm_mime() %>%
    gm_to(audience_email) %>%
    gm_from(organizer_email) %>%
    gm_subject(paste0("Next Applied Micro Seminar Sign-Up (",speaker_name,")")) %>%
    gm_text_body(msg)
  
  ### send an email
  gm_send_message(emailmsg)
  
}