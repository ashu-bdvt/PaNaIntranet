class Timesheet < ActiveRecord::Base
  
  validates :date, :presence => true
  
  validate :must_have_children

  def must_have_children
    if project_efforts.empty? or project_efforts.all? {|child| child.marked_for_destruction? }
      errors.add(:base, 'Timesheet must have at least one Project.')
    end
    
  end
  
  belongs_to :employee, :class_name => "Employee", :foreign_key => "employee_id"
  has_many :project_efforts, :dependent => :destroy  
  accepts_nested_attributes_for :project_efforts, :allow_destroy => true, :reject_if => lambda { |a| a[:project_id].blank? }
  
end
