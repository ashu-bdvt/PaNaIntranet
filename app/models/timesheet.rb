class Timesheet < ActiveRecord::Base
  
  belongs_to :employee, :class_name => "Employee", :foreign_key => "employee_id"
  has_many :project_efforts, :dependent => :destroy  
  accepts_nested_attributes_for :project_efforts, :allow_destroy => true, :reject_if => lambda { |a| a[:project_id].blank? }
  
end
