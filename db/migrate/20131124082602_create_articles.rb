class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :level
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
