class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.date :expiry_date

      t.timestamps null: false
    end
      add_foreign_key :notices, :users
  end
end
