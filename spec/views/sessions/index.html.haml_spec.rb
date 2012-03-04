require 'spec_helper'

describe "sessions/index" do
  before(:each) do
    assign(:sessions, [
      stub_model(Session,
        :wind_speed => 1,
        :wind_direction => 1,
        :comments => "MyText",
        :user => nil
      ),
      stub_model(Session,
        :wind_speed => 1,
        :wind_direction => 1,
        :comments => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of sessions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
