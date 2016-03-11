class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :image
      t.string :description
      t.string :stock_status
      t.string :delivery_time

      t.timestamps null: false
    end
  end
end
