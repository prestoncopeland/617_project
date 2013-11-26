json.array!(@messages) do |message|
  json.extract! message, :sender, :receiver
  json.url message_url(message, format: :json)
end
