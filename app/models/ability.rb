class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, Paper if user.admin? || user.super_admin?
    can :read, Paper, visibility: 'members' if user.member?
    can :read, Paper, visibility: 'public' unless user

  end
end
