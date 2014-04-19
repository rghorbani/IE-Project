json.array!(@bills) do |bill|
  json.extract! bill, :id, :expense_id, :unit_id, :price, :deadline, :description, :status
  json.url bill_url(bill, format: :json)
end
