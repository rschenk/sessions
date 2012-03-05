require 'spec_helper'

describe Session do
  it "should require a date" do
    Session.new(date: nil).should_not be_valid
    Session.new(date: Time.now).should be_valid
  end

  [:board, :kite, :location].each do |nested_model_name|
    describe "nested #{nested_model_name}" do
      before(:each) do
        @attr = {
          date: Time.now,
          user: FactoryGirl.create(:user)
        }
      
        @nested_attributes = "#{nested_model_name}_attributes".to_sym
        @nested_attr = {
          name: "A new nested #{nested_model_name}"
        }
        @foreign_key = "#{nested_model_name}_id".to_sym
      
        @nested_model = FactoryGirl.create(nested_model_name)
      end
    
      it "should accept parameters for a nested #{nested_model_name}" do
        sesh = Session.new(@attr.merge(@nested_attributes => @nested_attr))
        sesh.save!
        sesh.send(nested_model_name).should_not be_nil
        sesh.send(nested_model_name).name.should == @nested_attr[:name]
      end
    
      it "should set the user_id of the nested #{nested_model_name}" do
        sesh = Session.new(@attr.merge(@nested_attributes => @nested_attr))
        sesh.save!
        sesh.send(nested_model_name).user.should == sesh.user
      end
    
      it "should reject if the #{nested_model_name}'s name is blank" do
        sesh = Session.new(@attr.merge(@nested_attributes => { name: ''}))
        sesh.should be_valid
        sesh.send(nested_model_name).should be_nil
      end
    
      it "should favor the #{nested_model_name}_id if both #{nested_model_name}_id and #{nested_model_name}_attributes are given" do
        sesh = Session.new(@attr.merge(@foreign_key => @nested_model.id, @nested_attributes => @nested_attr))
        sesh.save!
        sesh.send(nested_model_name).should == @nested_model
      end
    end
  end
end
