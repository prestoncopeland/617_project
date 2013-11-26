class CreatePrivateForums < ActiveRecord::Migration
  def change
    create_table :private_forums do |t|
      t.integer :user_id
      t.integer :tution_session_id
      t.boolean :accept, :default => false

      t.timestamps
    end
  end
end
