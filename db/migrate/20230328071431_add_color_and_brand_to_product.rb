class AddColorAndBrandToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :color, :string 
    add_column :products, :brand, :string 
  end
end
