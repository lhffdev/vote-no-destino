JSON.parse(File.read(Rails.root.join('lib', 'seeds', 'destinos.json')), symbolize_names: true).each do |destino|
	Destino.create!(destino)
end