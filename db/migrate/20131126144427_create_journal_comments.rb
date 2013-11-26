class CreateJournalComments < ActiveRecord::Migration
  def change
    create_table :journal_comments do |t|
      t.integer :entry_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
