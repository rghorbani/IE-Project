json.array!(@units) do |unit|
  json.extract! unit, :id, :user_id, :building_id, :floor_number, :side, :unit_number, :area, :resident_count
  json.url unit_url(unit, format: :json)
end
