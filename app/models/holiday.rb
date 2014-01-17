class Holiday < ActiveRecord::Base
  attr_accessible :name, :date, :desciption
  validates :name, :date, :desciption, :presence => true
  validate :less_than_today                          

  def less_than_today
    if (date < Date.current )
      errors.add(:date, "must be current or future date")
    end
  end
end
