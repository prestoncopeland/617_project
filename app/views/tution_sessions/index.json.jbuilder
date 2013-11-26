json.array!(@tution_sessions) do |tution_session|
  json.extract! tution_session, :start_time, :end_time, :title, :description, :user_id
  json.url tution_session_url(tution_session, format: :json)
end
