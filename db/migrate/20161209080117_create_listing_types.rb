class CreateListingTypes < ActiveRecord::Migration
  def change
    create_table :listing_types do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
