class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true, index: true
      t.references :listing_type, foreign_key: true, index: true
      t.string :photo
      t.string :text
      t.decimal :price
      t.timestamps null: false
    end
  end
end
