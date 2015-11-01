class AddStateToTranslateTask < ActiveRecord::Migration
  def change
    add_column :translate_tasks, :translate_state, :string
  end
end
