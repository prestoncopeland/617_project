class RemoveJournalIdFromJournalComments < ActiveRecord::Migration
  def change
    remove_column :journal_comments, :journal_id, :integer
  end
end
