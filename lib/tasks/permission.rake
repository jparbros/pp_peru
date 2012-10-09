desc "Establecer los permisos de la aplicacion"
task :permission => [:environment] do
  types = ['Discussion', 'Entry', 'News', 'Proposal', 'User', 'Group', 'NewsActor', 'StrategicObjective']
  actions = ['read', 'create', 'update', 'destroy']
  types.each do |type|
    u_p = UserPermission.find_by_subject_class type
    unless u_p
      actions.each do |action|
        UserPermission.create!(subject_class: type, action: action)
      end #end each
    end #end unless
  end #end each
end# end task