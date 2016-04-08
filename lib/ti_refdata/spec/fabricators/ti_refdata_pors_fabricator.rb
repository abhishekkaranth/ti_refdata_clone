KNOWN_PORS_FABRICATORS = [
  :airport,
  :bus,
  :heliport,
  :offline,
  :port,
  :railway
]

KNOWN_PORS_FABRICATORS.each do |por_name|

  Fabricator(por_name, class_name: TiRefdata.const_get(por_name.to_s.camelize.to_sym)) do
    code 'CDG'
    name 'Paris - Charles-de-Gaulle'
    latitude 49.01278
    longitude 2.55
    country
    city { Fabricate(:paris) }
  end

end
