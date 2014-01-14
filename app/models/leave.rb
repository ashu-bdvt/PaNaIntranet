class Leave < ActiveRecord::Base
   
  validate :must_have_children

  def must_have_children
    if leavedays.empty? or leavedays.all? {|child| child.marked_for_destruction? }
      errors.add(:base, 'Leave must have at least one date.')
    end
    
  end
  
  belongs_to :leavetype, :class_name => "LeaveType", :foreign_key => "leavetype_id"
  belongs_to :employee, :class_name => "Employee", :foreign_key => "emp_id"
  
  has_many :leavedays, :dependent => :destroy  
  accepts_nested_attributes_for :leavedays, :allow_destroy => true, :reject_if => lambda { |a| a[:date].blank? }
   
end
