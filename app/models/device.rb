class Device < ActiveRecord::Base
  
  validates :device_name, :serial_no, :received_date, :presence => true
  validate :less_than_today
  
  belongs_to :project_manager, :class_name => "Employee", :foreign_key => "owner_id"
  belongs_to :project, :class_name => "Project", :foreign_key => "project_id"
    
  def less_than_today
    if (received_date > Date.current )
      errors.add(:received_date, "must be less that current date")
    end
  end
end
