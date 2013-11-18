require 'csv'

desc "Algunos usuarios"
task :users_a => [:environment] do
	users =  CSV.read('doc/padron_ayacuho.csv', headers: true)
	s_id = State.find_by_name('Ayacucho').try(:id) 
	p_id = Province.find_by_name('Huamanga').try(:id)
	d_id = District.find_by_name('Ayacucho').try(:id) 
	users.each do |u|
		if u['numero_documento'] and u['correo_electronico']
			user =	User.new(dni: u['numero_documento'], 
				middle_name: u['apellido_paterno'],
				last_name: u['apellido_materno'],
				name: u['nombres'],
				date_of_birth: u['fecha_nacimiento'].nil? ? nil : DateTime.strptime(u['fecha_nacimiento'], '%d/%m/%Y'),
				email:  u['correo_electronico'].nil? ? "#{u['numero_documento']}@rsipp.com" :  u['correo_electronico'],
				password: 'Passw0rd',
				password_confirmation: 'Passw0rd',
				state_id: s_id, 
				province_id: p_id,
				district_id: d_id )
			user.save
		end
	end
end

task :users_b => [:environment] do
	users =  CSV.read('doc/padron_san_martin.csv', headers: true)
	s_id = State.find_by_name('Ayacucho').try(:id) 
	p_id = Province.find_by_name('Huamanga').try(:id)
	d_id = District.find_by_name('Ayacucho').try(:id) 
	users.each do |u|
		if u['numero_documento'] and u['correo_electronico']
			user =	User.new(dni: u['numero_documento'], 
				middle_name: u['apellido_paterno'],
				last_name: u['apellido_materno'],
				name: u['nombres'],
				date_of_birth: u['fecha_nacimiento'].nil? ? nil : DateTime.strptime(u['fecha_nacimiento'], '%d/%m/%Y'),
				email:  u['correo_electronico'].nil? ? "#{u['numero_documento']}@rsipp.com" :  u['correo_electronico'],
				password: 'Passw0rd',
				password_confirmation: 'Passw0rd',
				state_id: s_id, 
				province_id: p_id,
				district_id: d_id )
			user.save
		end
	end
end