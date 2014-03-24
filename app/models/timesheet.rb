class Timesheet < ActiveRecord::Base
  
  belongs_to :employee, :class_name => "Employee", :foreign_key => "employee_id"
  has_many :tasks, :dependent => :destroy  
  accepts_nested_attributes_for :tasks, :allow_destroy => true, :reject_if => lambda { |a| a[:time].blank? }
  
end
