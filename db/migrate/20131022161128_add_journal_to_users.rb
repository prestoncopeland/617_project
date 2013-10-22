class AddJournalToUsers < ActiveRecord::Migration
  def change

    add_column :users, :journal_id, :integer

  end
end
