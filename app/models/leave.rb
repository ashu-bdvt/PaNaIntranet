class Leave < ActiveRecord::Base
 
  belongs_to :leavetype, :class_name => "Leavetype", :foreign_key => "leavetype_id"
  belongs_to :employee, :class_name => "Employee", :foreign_key => "emp_id"
  
  has_many :leavedays, :dependent => :destroy  
  accepts_nested_attributes_for :leavedays, :allow_destroy => true, :reject_if => lambda { |a| a[:date].blank? }
   
end
