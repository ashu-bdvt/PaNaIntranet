class Task < ActiveRecord::Base
  
  Intervals = %w[1 2 3 4 5 6 7]
  belongs_to :timesheet
  belongs_to :project, :class_name => "Project", :foreign_key => "project_id"
  
end
