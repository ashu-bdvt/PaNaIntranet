class Employee < ActiveRecord::Base
  belongs_to :manager, :class_name => "Employee", :foreign_key => "manager_id"
  has_many :devices
  has_many :leaves
  has_one :user

  attr_accessible :address, :contact_number, :date_of_joining, :designation, :email, :manager_id, :name, :photo
  validates :date_of_joining, :name, :designation, :contact_number, :presence => true
  validate :less_than_today                          

  validates :contact_number, :numericality => true,
                            :length => { :minimum => 10, :maximum => 15 }
                 
  def less_than_today
    if (date_of_joining > Date.current )
      errors.add(:date_of_joining, "must be less that current date")
    end
  end
  mount_uploader :photo, ImageUploader
=begin  
  def self.save(employee)
      name =  employee['image'].original_filename
      directory = "public/data"
      # create the file path
      path = File.join(directory, name)
      # write the file
      File.open(path, "wb") { |f| f.write(employee['image'].read) }
    end
=end
end
