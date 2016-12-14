class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.references :user, index: true
      t.integer :amount
      t.integer :cents
      t.integer :escrow_amount
      t.integer :escrow_cents

      t.timestamps null: false
    end
  end
end
