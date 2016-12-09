class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true, index: true
      t.string :title
      t.text :body
      t.date :event_date
      t.string :photo
      t.timestamps null: false
    end
  end
end
