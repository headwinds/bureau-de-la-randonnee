class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.boolean :promotion_applied
      t.integer :stock_level

      t.timestamps
    end
  end
end
