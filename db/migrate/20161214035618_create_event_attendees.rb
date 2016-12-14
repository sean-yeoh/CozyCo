class CreateEventAttendees < ActiveRecord::Migration
  def change
    create_table :event_attendees do |t|
      t.boolean :attending, default: false
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.timestamps null: false
    end
  end
end
