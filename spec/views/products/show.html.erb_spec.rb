require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    assign(:product, Product.create!(
      title: "Title",
      description: "MyText",
      price: "9.99",
      {5-2}: "{5 2}",
      image_url: "Image Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/{5 2}/)
    expect(rendered).to match(/Image Url/)
  end
end
