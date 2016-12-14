class AddStartTimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_time, :time
    add_column :events, :location, :string
    add_column :events, :POC, :string
  end
end
