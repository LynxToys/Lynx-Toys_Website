require 'rails_helper'

RSpec.describe "creations/edit", :type => :view do
  before(:each) do
    @creation = assign(:creation, Creation.create!())
  end

  it "renders the edit creation form" do
    render

    assert_select "form[action=?][method=?]", creation_path(@creation), "post" do
    end
  end
end
