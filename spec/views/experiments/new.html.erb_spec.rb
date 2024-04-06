require 'rails_helper'

RSpec.describe "experiments/new", type: :view do
  before(:each) do
    assign(:experiment, Experiment.new(
      primary: nil,
      user: nil,
      title: "MyString"
    ))
  end

  it "renders new experiment form" do
    render

    assert_select "form[action=?][method=?]", experiments_path, "post" do

      assert_select "input[name=?]", "experiment[primary_id]"

      assert_select "input[name=?]", "experiment[user_id]"

      assert_select "input[name=?]", "experiment[title]"
    end
  end
end
