
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    can :read, Paper if user.admin? || user.super_admin?
    can :read, Paper, visibility: 'members' if user.member?
    can :read, Paper, visibility: 'public' if user

  end
end
