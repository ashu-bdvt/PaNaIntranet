class HomeController < ApplicationController
 
  #Handle auhentication and take the suer to login page in not signed in.
  before_filter :authenticate_user!
  
  #Handle authorization and raise exception when the user does not have permission.
  #load_and_authorize_resource 
  
  #handle the cache and take the user to login page when back button is clicked after signout.
  before_filter :set_cache_buster

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

def index
    #get all employees from the model
    @employees = Employee.all
    #get all projects from the model
    @projects = Project.all
    #get all holidays from model
    @holidays = Holiday.all

end
    
def index2
    #get all employees from the model
    @employees = Employee.all
    #get all projects from the model
    @projects = Project.all
    #get all holidays from model
    @holidays = Holiday.all

end
    
end