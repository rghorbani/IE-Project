json.array!(@payments) do |payment|
  json.extract! payment, :id, :building_id, :payer_id, :trace_id
  json.url payment_url(payment, format: :json)
end
