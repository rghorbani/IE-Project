json.array!(@plans) do |plan|
  json.extract! plan, :id, :building_id, :formula, :unit_id, :rate
  json.url plan_url(plan, format: :json)
end
