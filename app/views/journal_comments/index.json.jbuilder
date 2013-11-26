json.array!(@journal_comments) do |journal_comment|
  json.extract! journal_comment, :entry_id, :user_id, :content
  json.url journal_comment_url(journal_comment, format: :json)
end
