require 'spec_helper'

describe "kites/edit" do
  before(:each) do
    @kite = assign(:kite, stub_model(Kite,
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders the edit kite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => kites_path(@kite), :method => "post" do
      assert_select "input#kite_name", :name => "kite[name]"
      assert_select "input#kite_user", :name => "kite[user]"
    end
  end
end
