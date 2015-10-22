class AddStrengthsToTranslateTasks < ActiveRecord::Migration
  def change
    add_column :translate_tasks, :source_language_strength, :integer
    add_column :translate_tasks, :destination_language_strength, :integer
  end
end
