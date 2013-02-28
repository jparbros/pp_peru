require 'csv'

desc "Llenar los estados y las provincias"

task :estados => [:environment] do
  rows =  CSV.read('doc/ubigeo2010.csv', headers: true)
  rows.group_by{|d| d['CODDPTO']}.each do |state_id, states|
    state = State.find_or_create_by_name(states.first['NOMBRE'].capitalize)
    states.delete_at(0)
    states.group_by{|d| d['CODPROV']}.each do |province_id, provinces|
      province = state.provinces.where(name: provinces.first['NOMBRE'].capitalize).first
      province = province ? province : state.provinces.create(name: provinces.first['NOMBRE'].capitalize)
      provinces.delete_at(0)
      provinces.group_by{|d| d['CODDIST']}.each do |distrito_id, districts|
        districts.each do |district_t|
          district = province.districts.where(name: district_t['NOMBRE'].capitalize).first
          district ? district : province.districts.create(name: district_t['NOMBRE'].capitalize)
        end # end each
      end
    end
  end
end