require 'rails_helper'

RSpec.describe "examples/new", type: :view do
  before(:each) do
    assign(:example, Example.new(
      experiment: nil,
      content: "MyText",
      embedding: 1,
      user: nil
    ))
  end

  it "renders new example form" do
    render

    assert_select "form[action=?][method=?]", examples_path, "post" do

      assert_select "input[name=?]", "example[experiment_id]"

      assert_select "textarea[name=?]", "example[content]"

      assert_select "input[name=?]", "example[embedding]"

      assert_select "input[name=?]", "example[user_id]"
    end
  end
end
