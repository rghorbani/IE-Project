json.array!(@units) do |unit|
  json.extract! unit, :id, :building_id, :floor, :resident_id, :area
  json.url unit_url(unit, format: :json)
end
