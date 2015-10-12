class CreateTranslateTasks < ActiveRecord::Migration
  def change
    create_table :translate_tasks do |t|
      t.string :name
      t.string :source_language
      t.string :destination_language
      t.string :country
      t.integer :owner_id
      t.integer :translator_id

      t.timestamps
    end
  end
end
