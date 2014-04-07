json.array!(@buildings) do |building|
  json.extract! building, :id, :floor_cnt, :units_cnt, :manager_id, :general_info
  json.url building_url(building, format: :json)
end
