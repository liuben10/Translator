class AddIndexToLanguageStrength < ActiveRecord::Migration
  def change
    add_index :language_strengths, [:user_id, :name], :unique => true
  end
end
