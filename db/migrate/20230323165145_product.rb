class Product < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :top_sell, :boolean        
  end
end
