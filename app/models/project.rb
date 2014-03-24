class Project < ActiveRecord::Base
  belongs_to :project_manager, :class_name => "Employee", :foreign_key => "manager_id" 
  has_many :devices
  has_many :tasks
  validates :name, :client, :start_date, :end_date, :presence => true
  validate :valid_project_tenure_needed

def valid_project_tenure_needed
  if (end_date < start_date)
    errors.add(:end_date, "must be greater than Start date")
  end
end
end
