desc "Establecer los permisos de la aplicacion"
task :permission => [:environment] do
  types = ['Discussion', 'Entry', 'News', 'Proposal', 'User', 'Group', 'NewsActor', 'StrategicObjective', 'Attendee']
  actions = ['read', 'create', 'update', 'destroy']
  types.each do |type|
    u_p = RolePermission.find_by_subject_class type
    unless u_p
      actions.each do |action|
        UserPermission.create!(subject_class: type, action: action)
      end #end each
    end #end unless
  end #end each
end# end task

task :create_roles => [:environment] do
  Role::ROLES.each do |role|
    Role.find_or_create_by_name(role)
  end
end

task :setup_roles => [:environment] do
  User.all.each do |u|
    unless u.role_c.eql? 'participant' 
      u.update_attributes(role_id: Role.find_by_name(u.role_c).id)
    end
  end
end