require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  let(:product) {
    Product.create!(
      title: "MyString",
      description: "MyText",
      price: "9.99",
      {5-2}: "MyString",
      image_url: "MyString"
    )
  }

  before(:each) do
    assign(:product, product)
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(product), "post" do

      assert_select "input[name=?]", "product[title]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[{5-2}]"

      assert_select "input[name=?]", "product[image_url]"
    end
  end
end
