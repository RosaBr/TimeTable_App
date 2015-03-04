class NotificationMailer < ActionMailer::Base
  #always send mail from this address unless specified otherwise
  default from: "testemailgroup1@gmail.com"

  def send_meeting_notification(meeting, creator)
    @meeting = meeting
    @user = creator
    #send user Registration email to that user
    mail(to: @meeting.meeting_created_by.to_s + '@umail.ucc.ie', subject: 'A meeting has been created.')

  end

end