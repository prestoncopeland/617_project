class AddDeckIdToFlashcards < ActiveRecord::Migration
  def change
    add_column :flashcards, :deck_id, :integer
  end
end
