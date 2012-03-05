require 'spec_helper'

describe "locations/index" do
  before(:each) do
    assign(:locations, [
      stub_model(Location,
        :name => "Name",
        :user => nil
      ),
      stub_model(Location,
        :name => "Name",
        :user => nil
      )
    ])
  end

  it "renders a list of locations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
