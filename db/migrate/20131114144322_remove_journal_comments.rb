class RemoveJournalComments < ActiveRecord::Migration
  def change
    drop_table :journal_comments
  end
end
