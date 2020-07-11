# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :user
      can :manage, Post, user_id: user.id
    elsif user.has_role? :admin
      can :manage, Post
    end
    can :read, Post
  end
end
