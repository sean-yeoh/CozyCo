class CreateConfirmations < ActiveRecord::Migration
  def change
    create_table :confirmations do |t|
      t.integer :reservation_id
      t.boolean :host_confirmation, default: false
      t.boolean :purchase_confirmation, default: false
      t.string :method

      t.timestamps null: false
    end
  end
end
