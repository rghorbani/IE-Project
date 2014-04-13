json.array!(@bills) do |bill|
  json.extract! bill, :id, :manager_id, :price, :description, :deadline, :state
  json.url bill_url(bill, format: :json)
end
