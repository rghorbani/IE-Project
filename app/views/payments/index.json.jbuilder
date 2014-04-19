json.array!(@payments) do |payment|
  json.extract! payment, :id, :bill_id, :user_id, :amount, :trace_number, :status, :message, :date
  json.url payment_url(payment, format: :json)
end
