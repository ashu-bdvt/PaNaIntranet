class ProjectEffort < ActiveRecord::Base
 
  validate :must_have_children

  def must_have_children
    if tasks.empty? or tasks.all? {|child| child.marked_for_destruction? }
      errors.add(:base, 'Proejct must have at least one Task.')
    end
    
  end
  
  belongs_to :timesheet
  belongs_to :project, :class_name => "Project", :foreign_key => "project_id"
  
  has_many :tasks, :dependent => :destroy  
  accepts_nested_attributes_for :tasks, :allow_destroy => true, :reject_if => lambda { |a| a[:time].blank? }
  
end
