require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        title: "Title",
        description: "MyText",
        price: "9.99",
        {5-2}: "{5 2}",
        image_url: "Image Url"
      ),
      Product.create!(
        title: "Title",
        description: "MyText",
        price: "9.99",
        {5-2}: "{5 2}",
        image_url: "Image Url"
      )
    ])
  end

  it "renders a list of products" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("{5 2}".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Image Url".to_s), count: 2
  end
end
