class CreateAvailableUsers < ActiveRecord::Migration
  def change
    create_table :available_users do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
