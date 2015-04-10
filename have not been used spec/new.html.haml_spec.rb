require 'rails_helper'

RSpec.describe "creations/new", :type => :view do
  before(:each) do
    assign(:creation, Creation.new())
  end

  it "renders new creation form" do
    render

    assert_select "form[action=?][method=?]", creations_path, "post" do
    end
  end
end
