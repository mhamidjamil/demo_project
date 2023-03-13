# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.manager?
      can :manage, Projects
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
