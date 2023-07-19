# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # if a user is logged in they can manage their own build orders and benchmarks
    return unless user.present?
    can :read, :all

    return unless user.admin?
    can :manage, :all
  end
end
