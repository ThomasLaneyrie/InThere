class AddLinkToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :link, :string
  end
end
