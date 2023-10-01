class CreateCakes < ActiveRecord::Migration[6.1]
  def change
    create_table :cakes do |t|
      t.bigint :user_id, null: false
      t.bigint :genre_id, null: false
      t.string :cake_name, null: false
      t.text :explanation, null: false
      t.integer :stock, null: false
      t.string :cost, null: false
      t.string :created_name, null: false
      t.string :updated_name, null: false
      t.boolean :deleted_flag, default: false

      t.timestamps
    end
  end
end
