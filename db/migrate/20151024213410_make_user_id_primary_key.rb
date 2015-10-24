class MakeUserIdPrimaryKey < ActiveRecord::Migration
  def change
    add_index :available_users, [:user_id], :unique => true
  end
end
