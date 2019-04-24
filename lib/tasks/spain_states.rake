namespace :spain_states do
  desc "Update Spain States"
  task update: :environment do

  	if !(country = Spree::Country.find_by(iso3: 'ESP'))
  		puts 'Run defaults configurations...'
		Rake::Task["db:seed"].invoke
		country = Spree::Country.find_by(iso3: 'ESP')
	end

  	puts 'Updating States for Spain'
	states  = Spree::State.where(country_id: country.id)
	states.destroy_all

	new_states = [
		{   name: 'A Coruña', abbr: 'C', country_id: country.id, updated_at: Time.now() },
	  	{ 	name: 'Alava', abbr: 'VI', country_id: country.id, updated_at: Time.now() },
		{	name: 'Albacete', abbr: 'AB', country_id: country.id, updated_at: Time.now() },
		{	name: 'Alicante', abbr: 'A', country_id: country.id, updated_at: Time.now() },
		{	name: 'Almería', abbr: 'AL', country_id: country.id, updated_at: Time.now() },
		{	name: 'Asturias, Principado de', abbr: 'AS', country_id: country.id, updated_at: Time.now() },
		{	name: 'Avila', abbr: 'AV', country_id: country.id, updated_at: Time.now() },
		{	name: 'Badajoz', abbr: 'BA', country_id: country.id, updated_at: Time.now() },
		{	name: 'Barcelona', abbr: 'B', country_id: country.id, updated_at: Time.now() },
		{	name: 'Bizkaia', abbr: 'BI', country_id: country.id, updated_at: Time.now() },
		{	name: 'Burgos', abbr: 'BU', country_id: country.id, updated_at: Time.now() },
		{	name: 'Cáceres', abbr: 'CC', country_id: country.id, updated_at: Time.now() },
		{	name: 'Cádiz', abbr: 'CA', country_id: country.id, updated_at: Time.now() },
		{	name: 'Cantabria', abbr: 'CB', country_id: country.id, updated_at: Time.now() },
		{	name: 'Castellón', abbr: 'CS', country_id: country.id, updated_at: Time.now() },
		{	name: 'Ciudad Real', abbr: 'CR', country_id: country.id, updated_at: Time.now() },
		{	name: 'Córdoba', abbr: 'CO', country_id: country.id, updated_at: Time.now() },
		{	name: 'Cuenca', abbr: 'CU', country_id: country.id, updated_at: Time.now() },
		{	name: 'Girona', abbr: 'GI', country_id: country.id, updated_at: Time.now() },
		{	name: 'Granada', abbr: 'GR', country_id: country.id, updated_at: Time.now() },
		{	name: 'Guadalajara', abbr: 'GU', country_id: country.id, updated_at: Time.now() },
		{	name: 'Guipúzcoa', abbr: 'SS', country_id: country.id, updated_at: Time.now() },
		{	name: 'Huelva', abbr: 'H', country_id: country.id, updated_at: Time.now() },
		{	name: 'Huesca', abbr: 'HU', country_id: country.id, updated_at: Time.now() },
		{	name: 'Illes Balears', abbr: 'IB', country_id: country.id, updated_at: Time.now() },
		{	name: 'Jaén', abbr: 'J', country_id: country.id, updated_at: Time.now() },
		{	name: 'La Rioja', abbr: 'RI', country_id: country.id, updated_at: Time.now() },
		{	name: 'Las Palmas de Gran Canaria', abbr: 'GC', country_id: country.id, updated_at: Time.now() },
		{	name: 'León', abbr: 'LE', country_id: country.id, updated_at: Time.now() },
		{	name: 'Lleida', abbr: 'LL', country_id: country.id, updated_at: Time.now() },
		{	name: 'Lugo', abbr: 'LU', country_id: country.id, updated_at: Time.now() },
		{	name: 'Madrid, Comunidad de', abbr: 'MD', country_id: country.id, updated_at: Time.now() },
		{	name: 'Málaga', abbr: 'MA', country_id: country.id, updated_at: Time.now() },
		{	name: 'Murcia, Región de', abbr: 'MC', country_id: country.id, updated_at: Time.now() },
		{	name: 'Navarra, Comunidad Foral ', abbr: 'NC', country_id: country.id, updated_at: Time.now() },
		{	name: 'Ourense', abbr: 'OR', country_id: country.id, updated_at: Time.now() },
		{	name: 'Palencia', abbr: 'PA', country_id: country.id, updated_at: Time.now() },
		{	name: 'Pontevedra', abbr: 'PO', country_id: country.id, updated_at: Time.now() },
		{	name: 'Salamanca', abbr:'SA', country_id: country.id, updated_at: Time.now() },
		{	name: 'Santa cruz de Tenerife', abbr:'TF', country_id: country.id, updated_at: Time.now() },
		{	name: "Santiago", abbr: 'SN', country_id: country.id, updated_at: Time.now() },
		{	name: 'Segovia', abbr: 'SG', country_id: country.id, updated_at: Time.now() },
		{	name: 'Sevilla', abbr: 'SE', country_id: country.id, updated_at: Time.now() },
		{	name: 'Soria', abbr:'SO', country_id: country.id, updated_at: Time.now()  },
		{	name: 'Tarragona', abbr: 'T', country_id: country.id, updated_at: Time.now() },
		{	name: 'Teruel', abbr: 'TE', country_id: country.id, updated_at: Time.now() },
		{	name: 'Toledo', abbr: 'TO', country_id: country.id, updated_at: Time.now() },
		{	name: 'Valencia', abbr: 'V', country_id: country.id, updated_at: Time.now() },
		{	name: 'Valladolid', abbr: 'VA', country_id: country.id, updated_at: Time.now() },
		{	name: "Vigo", abbr: 'VG', country_id: country.id, updated_at: Time.now() },
		{	name: 'Zamora', abbr: 'ZA', country_id: country.id, updated_at: Time.now() },
		{	name: 'Zaragoza', abbr: 'Z', country_id: country.id, updated_at: Time.now()}]

	Spree::State.create!(new_states)

	puts "Created #{new_states.count} states for Spain"
  end

end