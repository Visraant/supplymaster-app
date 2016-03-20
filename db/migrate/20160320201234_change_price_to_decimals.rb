class ChangePriceToDecimals < ActiveRecord::Migration
  def change
    remove_column :orders, :subtotal, :decimal, precision: 10, scale: 2
    remove_column :orders, :tax, :decimal, precision: 10, scale: 2
    remove_column :orders, :total, :decimal, precision: 10, scale: 2
    add_column :orders, :subtotal, :decimal, precision: 10, scale: 2
    add_column :orders, :tax, :decimal, precision: 10, scale: 2
    add_column :orders, :total, :decimal, precision: 10, scale: 2
  end
end
