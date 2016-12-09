class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :resident_type, :string
    add_column :users, :role, :integer, default: 0
    add_column :users, :unit_number, :string
    add_column :users, :photo, :string
  end
end
