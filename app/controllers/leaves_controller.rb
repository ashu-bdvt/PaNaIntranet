class LeavesController < ApplicationController
  
  #Handle auhentication and take the suer to login page in not signed in.
  before_filter :authenticate_user!
  
  #Handle authorization and raise exception when the user does not have permission.
  #load_and_authorize_resource 
  load_and_authorize_resource :class => Leave
  
  #handle the cache and take the user to login page when back button is clicked after signout.
  before_filter :set_cache_buster

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
  def new
    @leave = Leave.new
    3.times do
    leaveday = @leave.leavedays.build
  end
   
 end
  
  # def new
    # @leave = Leave.new
# 
    # respond_to do |format|
      # format.html # new.html.erb
      # format.json { render json: @leave }
    # end
  # end
  
  def create
    Rails.logger.info "Create Method called.."
    @leave = Leave.new(params[:leave])
    
    #Assign employee id of the user logged in
    @leave.emp_id = current_user.employee.id
    
    #Assign the status to zero (request)
    @leave.status = 0 
 
    respond_to do |format|
      if @leave.save 
        format.html { redirect_to leaves_path, notice: 'Successfully created the leave request.' }
        format.json { render json: @leave, status: :created, location: @leave }
      else
        format.html { render action: "new" }
        format.json { render json: @leave.errors, status: :unprocessable_entity }
      end
    end    
  end
 
  def index
     #@leaves = Leave.find(:all)
     if can? :update, @user 
       #Display all leave requests for the admin user
       @leaves = Leave.where("status = '0'")            
      else  
        #Display all there leaves for the proadmin and employee user
        @leaves = Leave.where("status = ? OR emp_id = ?", '1', current_user.employee.id)
     end
  end
  
  def show 
    @leave = Leave.find(params[:id])
  end
  
   # GET /leaves/1/edit
  def edit
    @leave = Leave.find(params[:id])
    
  end
  
   def update  
    @leave = Leave.find(params[:id])

    respond_to do |format|
      
       if @leave.update_attributes(params[:leave]) 
        format.html { redirect_to leaves_path, notice: 'Successfully updated the leave request' }
        format.json { render json: @leave, status: :created, location: @leave }
      else
        format.html { render action: "index" }
        format.json { render json: @leavetype.errors, status: :unprocessable_entity }
      end
    end
  end
   
  def show
    @leave = Leave.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leave }
    end
  end 
    
  def destroy
    @leave = Leave.find(params[:id])
    @leave.destroy

    respond_to do |format|
      format.html { redirect_to leaves_path }
      format.json { head :no_content }
    end
  end  

end
