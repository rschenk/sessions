require 'spec_helper'

describe Location do
  before(:each) do
    @attr = {
      name: 'Chappaquoit Beach'
    }
  end
  it "should create a new one given valid attrs" do
    Location.create!(@attr)
  end
  it "should require a name" do
    Location.new(@attr.merge(name: '')).should_not be_valid
  end
end
