class ChangesToProducts < ActiveRecord::Migration
  def change
    change_column :products, :description, :text
    change_column :products, :price, "numeric USING CAST(price AS numeric)", precision: 9, scale: 2
    add_column :products, :in_stock, :boolean, :default => true
  end
end
