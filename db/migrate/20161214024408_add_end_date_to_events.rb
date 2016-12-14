class AddEndDateToEvents < ActiveRecord::Migration
  def change
    remove_column :events, :event_date, :date
    add_column :events, :start_date, :date
    add_column :events, :end_date, :date
  end
end
