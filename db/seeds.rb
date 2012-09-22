# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Setup permissions
puts "Setup Permisos"
types = ['Discussion', 'Entry', 'News', 'Proposal', 'User', 'Group', 'NewsActor']
actions = ['read', 'create', 'update', 'destroy']
types.each do |type|
  actions.each do |action|
    UserPermission.create!(subject_class: type, action: action)
  end
end
puts 'Setup Configurable'
Configurable.create
puts 'Seed terminado....'