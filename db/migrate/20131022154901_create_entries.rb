class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :language
      t.text :entry
      t.integer :journal_id
      t.timestamps
    end
  end
end
