class RemoveAmountAndCentsFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :amount, :integer
    remove_column :listings, :cents, :integer
  end
end
