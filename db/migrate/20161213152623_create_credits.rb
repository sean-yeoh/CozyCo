class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.references :user, index: true
      t.string :amount
      t.string :escrow_amount

      t.timestamps null: false
    end
  end
end
