class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :payment_method
      t.string :nonce
      t.integer :amount
      t.integer :cents
      t.timestamps null: false
    end
  end
end
