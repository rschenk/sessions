require 'spec_helper'

describe "kites/show" do
  before(:each) do
    @kite = assign(:kite, stub_model(Kite,
      :name => "Name",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
