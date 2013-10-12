class AddStudyLanguageToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :study_language, :string
  end
end
