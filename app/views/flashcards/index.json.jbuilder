json.array!(@flashcards) do |flashcard|
  json.extract! flashcard, :front, :back
  json.url flashcard_url(flashcard, format: :json)
end
