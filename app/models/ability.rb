# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can(:manage, Food, user:)
    can(:manage, Recipe, user:)

    can :read, :all
  end
end
