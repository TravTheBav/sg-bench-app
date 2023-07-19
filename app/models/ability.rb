# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, User, id: user.id
      can :read, BuildOrder, user_id: user.id
      can :read, AttackBenchmark, user_id: user.id      
    end
  end
end
