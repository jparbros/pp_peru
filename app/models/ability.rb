
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: 'participant') # guest user
    can :manage, :all if user.super_admin?
  #  can :read, Paper if user.admin? || user.super_admin?
  #  can :read, Paper, visibility: 'members' if user.member?
   # can :read, [News, Proposal] , visibility: 'public' if user.participant?
    
    user.user_permissions.each do |permission|
      can permission.action.to_sym, permission.subject_class.constantize 
    end
  end
end