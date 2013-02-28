require 'csv'

desc "Llenar los estados y las provincias"

task :estados => [:environment] do
  rows =  CSV.read('doc/ubigeo2010.csv', headers: true)
  rows.group_by{|d| d['CODDPTO']}.each do |state_id, states|
    state = State.where("lower(name) = ?", states.first['NOMBRE'].downcase).first
    state = state ? state : State.create(name: states.first['NOMBRE'].capitalize)
    states.delete_at(0)
    states.group_by{|d| d['CODPROV']}.each do |province_id, provinces|
      province = state.provinces.where("lower(name) = ?", provinces.first['NOMBRE'].downcase).first
      province = province ? province : state.provinces.create(name: provinces.first['NOMBRE'].capitalize)
      provinces.delete_at(0)
      provinces.group_by{|d| d['CODDIST']}.each do |distrito_id, districts|
        districts.each do |district_t|
          district = province.districts.where("lower(name) = ?", district_t['NOMBRE'].downcase).first
          district ? district : province.districts.create(name: district_t['NOMBRE'].capitalize)
        end # end each
      end
    end
  end
end