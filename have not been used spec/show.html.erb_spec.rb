require 'rails_helper'

RSpec.describe "creations/show", :type => :view do
  before(:each) do
    @creation = assign(:creation, Creation.create!(:name => "slicer"))
    
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match /slicer/
  end
end
