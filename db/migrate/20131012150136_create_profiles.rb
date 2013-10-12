class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :country
      t.string :time_zone
      t.string :native_langugage
      t.string :blog_url
      t.text :description

      t.timestamps
    end
  end
end
