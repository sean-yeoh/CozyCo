class RemovePriceAndAddAmountWithCents < ActiveRecord::Migration
  def change
    remove_column :listings, :price, :decimal
    add_column :listings, :amount, :integer
    add_column :listings, :cents, :integer
  end
end
