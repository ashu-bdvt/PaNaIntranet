class Task < ActiveRecord::Base
  
  Intervals = %w[1 2 3 4 5 6 7]
  belongs_to :project_effort
  
end
