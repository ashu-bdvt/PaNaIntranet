class ProjectEffort < ActiveRecord::Base
  
  belongs_to :timesheet
  belongs_to :project, :class_name => "Project", :foreign_key => "project_id"
  
  has_many :tasks, :dependent => :destroy  
  accepts_nested_attributes_for :tasks, :allow_destroy => true, :reject_if => lambda { |a| a[:time].blank? }
  
end
