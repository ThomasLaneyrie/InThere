require 'rails_helper'

RSpec.describe "comments/show", type: :view do
  before(:each) do
    assign(:comment, Comment.create!(
      title: "Title",
      content: "MyText",
      note: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
