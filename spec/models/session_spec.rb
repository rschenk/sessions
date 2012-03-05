require 'spec_helper'

describe Session do
  it "should require a date" do
    Session.new(date: nil).should_not be_valid
    Session.new(date: Time.now).should be_valid
  end
end
