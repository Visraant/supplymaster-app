class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.string :subtotal
      t.string :tax
      t.string :total

      t.timestamps null: false
    end
  end
end
