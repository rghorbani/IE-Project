json.array!(@plans) do |plan|
  json.extract! plan, :id, :building_id, :name, :number
  json.url plan_url(plan, format: :json)
end
