json.array!(@stations) do |station|
  json.extract! station, :id, :name, :lat, :long
  json.url stations_getNames_path(station, format: :json)
end