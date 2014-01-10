class LeavesController < ApplicationController
  
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
  
  def edit
    
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
  
   def update  
    @leave = Leave.find(params[:id])

    respond_to do |format|
      if @leave.update_attributes(status: params[:status])
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
    for leaveday in @leave.leavedays 
      Rails.logger.info "I am here....................."
      Rails.logger.info  leaveday.leave_id 
      Rails.logger.info "I am done....................."
    end
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
