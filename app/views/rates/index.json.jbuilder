json.array!(@rates) do |rate|
  json.extract! rate, :id, :plan_id, :unit_id, :rate
  json.url rate_url(rate, format: :json)
end
