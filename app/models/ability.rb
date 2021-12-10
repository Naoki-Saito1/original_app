# frozen_string_literal: true
# cannot :manage, :all
# unless user.admin? 
#   cannot :access, :rails_admin
# end 
class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.try(:admin?)
      can :access, :rails_admin
      can :manage, :all
    end
    
  end
end
