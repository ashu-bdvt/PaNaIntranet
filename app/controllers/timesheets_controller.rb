class TimesheetsController < ApplicationController
  
  #Handle auhentication and take the suer to login page in not signed in.
  before_filter :authenticate_user!
  
  #Handle authorization and raise exception when the user does not have permission.
  load_and_authorize_resource 
  #load_and_authorize_resource :class => Timesheet
  
  #handle the cache and take the user to login page when back button is clicked after signout.
  before_filter :set_cache_buster

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
  # GET /timesheets
  # GET /timesheets.json
  def index
    
   if can? :update, @user 
      
      #Display all the user timesheets for the admin user 
      @date = params[:month] ? Date.parse(params[:month]) : Date.today
    
      #Display only the timesheet of the employee who has logged in 
      @timesheets = Timesheet.where("employee_id" => params[:employee_id]).all 
     
     else  
       #Display all there timesheets for the proadmin and employee user
       @date = params[:month] ? Date.parse(params[:month]) : Date.today
       
       #Display only the timesheet of the employee who has logged in
       @timesheets = Timesheet.where("employee_id" => current_user.employee.id).all                 
     end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @timesheets }
    end
  end
  
  # GET /timesheets/1
  # GET /timesheets/1.json
  def show
    @timesheet = Timesheet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @timesheet }
    end
  end

  # GET /timesheets/new
  # GET /timesheets/new.json
  def new
    @timesheet = Timesheet.new
    
    1.times do
    task = @timesheet.tasks.build
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @timesheet }
    end
  end

  # GET /timesheets/1/edit
  def edit
    @timesheet = Timesheet.find(params[:id])
  end

  # POST /timesheets
  # POST /timesheets.json
  def create
    @timesheet = Timesheet.new(params[:timesheet])

    #Assign employee id of the user logged in
    @timesheet.employee_id = current_user.employee.id
    
    respond_to do |format|
      if @timesheet.save
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully created.' }
        format.json { render json: @timesheet, status: :created, location: @timesheet }
      else
        format.html { render action: "new" }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /timesheets/1
  # PUT /timesheets/1.json
  def update
    
    @timesheet = Timesheet.find(params[:id])

    respond_to do |format|
      if @timesheet.update_attributes(params[:timesheet])
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheets/1
  # DELETE /timesheets/1.json
  def destroy
    @timesheet = Timesheet.find(params[:id])
    @timesheet.destroy

    respond_to do |format|
      format.html { redirect_to timesheets_url }
      format.json { head :no_content }
    end
  end
  
end
