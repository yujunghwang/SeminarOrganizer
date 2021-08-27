### set configuration
# This is an example file
# fill out this code to use in your setting

### Set organizer / audience information
### Organizer first name
organizer_name="Yujung"

### Organizer email address
organizer_email ="yujungghwang@gmail.com"

### Audience email
audience_email ="XX@gmail.com"

### Zoom link for the seminar
zoom_link="https://zoom.us/j/xxxxxx"

### Zoom link to meet the speaker one-to-one
meeting_link="https://zoom.us/j/xxxxx"

### sign up information
signup_link ="https://docs.google.com/spreadsheets/d/xxxxxxx"
grad_signup_time ="Monday 10AM"


### set a directory for a Gmail Client ID json file
FILEDIR="C:/Users/xxxxx"
### set a filename for the json file
FILENAME="gmailr.json"

# configure Gmail API
gm_auth_configure(path=paste0(FILEDIR,FILENAME))
gm_auth(email=organizer_email)

### read seminar schedule info (CHANGE THE SPREADSHEET LINK BELOW)

### set a directory for Google Sheet API json file
FILENAME="GoogleSheetAPI.json"
gs4_auth(email=organizer_email,path=paste0(FILEDIR,FILENAME))

seminar_schedule_link <- "https://docs.google.com/spreadsheets/d/xxxxx"
seminar_schedule <- read_sheet(seminar_schedule_link)

# compute the days until the next seminar
daysleft <- as.Date(seminar_schedule$Date) - Sys.Date()
ind <- which(daysleft>=0)[1]

### retrieve the next speaker information 
### seminar speaker name
speaker_name =seminar_schedule$Speaker[ind]

### speaker email
speaker_email =seminar_schedule$Email[ind]

### speaker institution
speaker_institution =seminar_schedule$Institution[ind]

### paper title
paper_title =seminar_schedule$PaperTitle[ind]

### paper link
paper_link =seminar_schedule$PaperLink[ind]

### seminar date and time
seminar_date=seminar_schedule$Date[ind]
seminar_time=seminar_schedule$Time[ind]

### virtual/in-person
seminar_place=seminar_schedule$Virtual[ind]

