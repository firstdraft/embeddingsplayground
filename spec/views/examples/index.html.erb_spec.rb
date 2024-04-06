require "rails_helper"

RSpec.describe "examples/index" do
  before do
    assign(:examples, [
      Example.create!(
        experiment: nil,
        content: "MyText",
        embedding: 2,
        user: nil
      ),
      Example.create!(
        experiment: nil,
        content: "MyText",
        embedding: 2,
        user: nil
      )
    ])
  end

  it "renders a list of examples" do
    render
    cell_selector = (Rails::VERSION::STRING >= "7") ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
