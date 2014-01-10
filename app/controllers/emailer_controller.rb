class EmailerController < ApplicationController
  
  #Handle authorization and raise exception when the user does not have permission.
  load_and_authorize_resource 
  
  #Handle auhentication and take the suer to login page in not signed in.
  before_filter :authenticate_user!
  
  #handle the cache and take the user to login page when back button is clicked after signout.
  before_filter :set_cache_buster

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
  def email
    render :file => 'app\views\emailer\email.html.erb'
  end
  
  #habdle the send mail action and display success message when email is sent
  def sendmail
    email = params["email"]
    recipient = email["recipient"]
    subject = email["subject"]
    message = email["message"]
    
    Emailer.sendmail(recipient, subject, message).deliver
    render :text => "Email has been sent successfully" 
    #Emailer.sendmail.deliver
  end
   
end
