class Emailer < ActionMailer::Base
   default :from => "shivakumar@panainfotech.com"
  
  def sendmail(recipient, subject, message)
    logger.info("Passed values")
    logger.info(recipient)
    logger.info(subject)
    logger.info(message)
    
    #@user = user
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => recipient, :subject => subject, :content_type => message)
  end
 
 def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Registration Confirmation')
 end
 
end
