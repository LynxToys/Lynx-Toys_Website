require 'rails_helper'

RSpec.describe "creations/index", :type => :view do
  before(:each) do
    assign(:creations, [
      Creation.create!(:name => "slicer"),
      Creation.create!(:name => "dicer")
    ])
  end

  it "renders a list of creations" do
    render
    expect(rendered).to match /slicer/
    expect(rendered).to match /dicer/
  end
end
