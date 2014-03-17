class Ability 
  include CanCan::Ability
  
  def initialize(user)
   
   #Check the user role and give the permissions .
   if user.role == "admin"
      can :manage, :all
   else if user.role == "proadmin"  
      can :manage, Device
      can :read, :all
   else # default
      can :read, :all
    end
  end
  
end
   
end   
