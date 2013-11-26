class CreateTutionSessions < ActiveRecord::Migration
  def change
    create_table :tution_sessions do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
