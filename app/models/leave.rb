class Leave < ActiveRecord::Base
   
  validate :must_have_children

  def must_have_children
    if leave_days.empty? or leave_days.all? {|child| child.marked_for_destruction? }
      errors.add(:base, 'Leave must have at least one date.')
    end
    
  end
  
  belongs_to :leavetype, :class_name => "LeaveType", :foreign_key => "leavetype_id"
  belongs_to :employee, :class_name => "Employee", :foreign_key => "emp_id"
 
  has_many :leave_days, :dependent => :destroy  
  accepts_nested_attributes_for :leave_days, :allow_destroy => true, :reject_if => lambda { |a| a[:date].blank? }
   
end
