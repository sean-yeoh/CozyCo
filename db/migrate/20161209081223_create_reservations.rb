class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true, index: true
      t.references :listing, foreign_key: true, index: true
      t.references :confirmation, foreign_key: true, index: true
      t.string :date, array: true
      t.timestamps null: false
      t.timestamps null: false
    end
  end
end
