require "rails_helper"

RSpec.describe "examples/show" do
  before do
    assign(:example, Example.create!(
      experiment: nil,
      content: "MyText",
      embedding: 2,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
