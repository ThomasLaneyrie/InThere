class CreateProductWishlists < ActiveRecord::Migration[7.0]
  def change
    create_table :product_wishlists do |t|
      t.belongs_to :wishlist, index: true
      t.belongs_to :product, index: true
      t.timestamps
    end
  end
end
