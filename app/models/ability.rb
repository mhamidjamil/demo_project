# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
  # user.manager can only create project
  # user.manager can only delete project
  # user.qa can only create bugs
  # user.developer can only update bugs on his projects
  # user.developer can only update his own profile

    user ||= User.new # guest user (not logged in)
    if user.manager?
      can :manage, Projects
      can :manage, Bugs
      can :manage, Users
    elsif user.qa?
      can :manage, Bugs
    elsif user.developer?
      can :manage, Bugs, :project => { :user_id => user.id }
      can :manage, Users, :id => user.id
    else
      can :read, :all
    end


  end

end
