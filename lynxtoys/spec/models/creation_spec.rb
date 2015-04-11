require 'rails_helper'

RSpec.describe Creation, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  
  it "has none to begin with" do
    expect(Creation.count).to eq 0
  end

  it "has one after adding one" do
    Creation.create(:name => "slicer",:creator_name => "Scot")
    expect(Creation.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Creation.count).to eq 0
  end

  it "can not be created if name is missing" do
    Creation.create(:creator_name => "Scot")
    expect(Creation.count).to eq 0
  end

end
