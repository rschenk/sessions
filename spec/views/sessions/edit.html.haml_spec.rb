require 'spec_helper'

describe "sessions/edit" do
  before(:each) do
    @session = assign(:session, stub_model(Session,
      :wind_speed => 1,
      :wind_direction => 1,
      :comments => "MyText",
      :user => nil
    ))
  end

  it "renders the edit session form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sessions_path(@session), :method => "post" do
      assert_select "input#session_wind_speed", :name => "session[wind_speed]"
      assert_select "input#session_wind_direction", :name => "session[wind_direction]"
      assert_select "textarea#session_comments", :name => "session[comments]"
      assert_select "input#session_user", :name => "session[user]"
    end
  end
end
