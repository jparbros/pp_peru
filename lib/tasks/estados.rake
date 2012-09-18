require 'csv'

desc "Llenar los estados y las provincias"
task :estados => [:environment] do
  CSV.foreach('doc/estados_provincias.csv', headers: true) do |row|
    state = State.find_or_create_by_name(row['region'])
    state.provinces.create(name: row['provincia'])
  end
end