json.array!(@events) do |event|
  json.extract! event, :id, :title, :event_time, :description, :need_to_send_mail
  json.url event_url(event, format: :json)
end
