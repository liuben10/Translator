class AddAvailableToUsers < ActiveRecord::Migration
  def change
    add_column :users, :available, :integer, :default => 0
  end
end
