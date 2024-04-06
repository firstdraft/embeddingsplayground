require 'rails_helper'

RSpec.describe "experiments/show", type: :view do
  before(:each) do
    assign(:experiment, Experiment.create!(
      primary: nil,
      user: nil,
      title: "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
  end
end
