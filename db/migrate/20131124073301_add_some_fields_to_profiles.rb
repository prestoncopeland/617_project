class AddSomeFieldsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :address, :string
    add_column :profiles, :date_of_birth, :date
    add_column :profiles, :sec_q_1, :string
    add_column :profiles, :sec_q_2, :string
    add_column :profiles, :sec_q_3, :string
    add_column :profiles, :sec_a_1, :string
    add_column :profiles, :sec_a_2, :string
    add_column :profiles, :sec_a_3, :string
  end
end
