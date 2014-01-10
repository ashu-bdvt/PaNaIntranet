class User < ActiveRecord::Base
  
  ROLES = %w[proadmin emp admin]
  
  belongs_to :employee, :class_name => "Employee", :foreign_key => "emp_id"
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :emp_id
  
end
