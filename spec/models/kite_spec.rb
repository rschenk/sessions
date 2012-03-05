require 'spec_helper'

describe Kite do
  before(:each) do
    @attr = {
      name: 'Wainmain Bunny'
    }
  end
  it "should create a new one given valid attrs" do
    Kite.create!(@attr)
  end
  it "should require a name" do
    Kite.new(@attr.merge(name: '')).should_not be_valid
  end
end
