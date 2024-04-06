require 'rails_helper'

RSpec.describe "examples/edit", type: :view do
  let(:example) {
    Example.create!(
      experiment: nil,
      content: "MyText",
      embedding: 1,
      user: nil
    )
  }

  before(:each) do
    assign(:example, example)
  end

  it "renders the edit example form" do
    render

    assert_select "form[action=?][method=?]", example_path(example), "post" do

      assert_select "input[name=?]", "example[experiment_id]"

      assert_select "textarea[name=?]", "example[content]"

      assert_select "input[name=?]", "example[embedding]"

      assert_select "input[name=?]", "example[user_id]"
    end
  end
end
