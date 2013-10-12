class FixLanguageColumnName < ActiveRecord::Migration
  def change
  	rename_column :profiles, :native_langugage, :native_language
  end
end
