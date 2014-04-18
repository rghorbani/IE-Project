json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :first_name, :last_name, :gender, :family_size, :cardnumber
  json.url profile_url(profile, format: :json)
end
