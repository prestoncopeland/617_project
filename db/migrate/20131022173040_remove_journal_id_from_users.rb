class RemoveJournalIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :journal_id, :integer
  end
end
