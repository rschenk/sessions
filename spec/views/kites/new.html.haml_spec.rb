require 'spec_helper'

describe "kites/new" do
  before(:each) do
    assign(:kite, stub_model(Kite,
      :name => "MyString",
      :user => nil
    ).as_new_record)
  end

  it "renders new kite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => kites_path, :method => "post" do
      assert_select "input#kite_name", :name => "kite[name]"
      assert_select "input#kite_user", :name => "kite[user]"
    end
  end
end
