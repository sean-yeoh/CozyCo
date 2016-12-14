class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :topic, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
