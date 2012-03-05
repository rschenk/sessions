require 'spec_helper'

describe Board do
  before(:each) do
    @attr = {
      name: 'Grain Waka'
    }
  end
  it "should create a new one given valid attrs" do
    Board.create!(@attr)
  end
  it "should require a name" do
    Board.new(@attr.merge(name: '')).should_not be_valid
  end
end
