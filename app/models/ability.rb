
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role_id: 1) # guest user
    can :manage, :all if user.super_admin?
    can :config_site if user.super_admin?
    can :assign_super_admin_role, User if user.super_admin?
    can :read, [News, Proposal, Discussion, Entry] , visibility: 'public' if user.participant?
    
    user.role_permissions.each do |permission|
      can permission.action.to_sym, permission.subject_class.constantize 
    end
  end
end