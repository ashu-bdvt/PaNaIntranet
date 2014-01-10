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
    
    #check the selected date and decide the leave status 
    #if @leave.date > Date.today
    #  @leave.status = 0 
    # else 
    #   @leave.status = 1
    # end 
  
    respond_to do |format|
      if @leave.save 
        format.html { redirect_to leaves_path, notice: 'successfully created the leave request.' }
        format.json { render json: @leave, status: :created, location: @leave }
      else
        #format.html { render action: "new" }
        #format.json { render json: @leave.errors, status: :unprocessable_entity }
      end
    end    
  end
  
  def edit
    
  end
  
  def index
     #@leaves = Leave.find(:all)
     if can? :update, @user 
       @leaves = Leave.where("status = '0'")            
      else  
        @leaves = Leave.where(status = '1', emp_id = current_user.employee.id)
     end
  end
  
  def show 
    @leave = Leave.find(params[:id])
  end
  
   def update  
    @leave = Leave.find(params[:id])

     
    respond_to do |format|
      if @leave.update_attributes(status: 1)
        #format.html { redirect_to @leavetype, notice: 'Leavetype was successfully updated.' }
        #format.json { head :no_content }
      else
        #format.html { render action: "edit" }
        #format.json { render json: @leavetype.errors, status: :unprocessable_entity }
      end
    end
  end
   
  def show
    @leave = Leave.find(params[:id])

    for leaveday in @leave.leavedays 
    
    Rails.logger.info "I am here ok....................."
    Rails.logger.info  leaveday.leave_id 
    Rails.logger.info "I am done ok....................."
    
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leave }
    end
  end 
    
    
end
