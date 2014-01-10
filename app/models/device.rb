class Device < ActiveRecord::Base
  
  belongs_to :project_manager, :class_name => "Employee", :foreign_key => "owner_id"
  belongs_to :project, :class_name => "Project", :foreign_key => "project_id"
  
end
