require 'rails_helper'

RSpec.describe "experiments/edit", type: :view do
  let(:experiment) {
    Experiment.create!(
      primary: nil,
      user: nil,
      title: "MyString"
    )
  }

  before(:each) do
    assign(:experiment, experiment)
  end

  it "renders the edit experiment form" do
    render

    assert_select "form[action=?][method=?]", experiment_path(experiment), "post" do

      assert_select "input[name=?]", "experiment[primary_id]"

      assert_select "input[name=?]", "experiment[user_id]"

      assert_select "input[name=?]", "experiment[title]"
    end
  end
end
