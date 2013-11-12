class AddEntryIdToJournalComments < ActiveRecord::Migration
  def change
    add_column :journal_comments, :entry_id, :integer
  end
end
