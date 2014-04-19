json.array!(@expenses) do |expense|
  json.extract! expense, :id, :user_id, :price, :description, :release_date, :deadline, :number
  json.url expense_url(expense, format: :json)
end
