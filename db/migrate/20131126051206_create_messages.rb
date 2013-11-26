class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender
      t.integer :receiver
      t.integer :private_forum_id
      t.text :content

      t.timestamps
    end
  end
end
