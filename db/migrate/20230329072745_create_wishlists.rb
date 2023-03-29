class CreateWishlists < ActiveRecord::Migration[7.0]
  def change
    create_table :wishlists do |t|
      t.string :title
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
