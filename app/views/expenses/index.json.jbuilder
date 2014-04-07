json.array!(@expenses) do |expense|
  json.extract! expense, :id, :manager_id, :price, :description, :deadline, :plan
  json.url expense_url(expense, format: :json)
end
