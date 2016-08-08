class RenameuserdIdinCartedProducts < ActiveRecord::Migration
  def change
    rename_column :carted_products, :userd_id, :user_id
  end
end
