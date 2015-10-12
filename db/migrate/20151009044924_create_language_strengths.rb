class CreateLanguageStrengths < ActiveRecord::Migration
  def change
    create_table :language_strengths do |t|
      t.string :name
      t.integer :strength
      t.integer :user_id

      t.timestamps
    end
  end
end
