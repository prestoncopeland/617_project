json.array!(@private_forums) do |private_forum|
  json.extract! private_forum, :user_id, :tution_session_id, :accept
  json.url private_forum_url(private_forum, format: :json)
end
