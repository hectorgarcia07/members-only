# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :manage, Post, user_id: user.id
      
    else
      can :read, Post
      
    end
  end
end
