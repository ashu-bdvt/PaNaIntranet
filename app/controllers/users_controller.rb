class UsersController < ApplicationController
 
  #Handle auhentication and take the user to login page if not signed in.
  before_filter :authenticate_user!
 
  #Handle authorization and raise exception when the user does not have permission.
  load_and_authorize_resource 
  
  #handle the cache and take the user to login page when back button is clicked after signout.
  before_filter :set_cache_buster

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
 
  def new
    @user = User.new
     respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }
      end
  end
    
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        Emailer.welcome_email(@user).deliver        
        #format.html { redirect_to "/", notice: 'User was successfully registered.' }
        #format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
   end    

end

 