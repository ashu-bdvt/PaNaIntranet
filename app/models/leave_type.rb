class LeaveType < ActiveRecord::Base
  attr_accessible :name, :max_leaves
  validates :name, :max_leaves, :presence => true
  validates_numericality_of :max_leaves, :greater_than => 0
end
