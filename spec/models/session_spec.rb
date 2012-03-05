require 'spec_helper'

describe Session do
  it "should require a date" do
    Session.new(date: nil).should_not be_valid
    Session.new(date: Time.now).should be_valid
  end
  
  describe "nested boards" do
    before(:each) do
      @attr = {
        date: Time.now,
        user: FactoryGirl.create(:user)
      }
      
      @board_attr = {
        name: "Shred Stick"
      }
      
      @board = FactoryGirl.create(:board)
    end
    
    it "should accept parameters for a nested board" do
      sesh = Session.new(@attr.merge(board_attributes: @board_attr))
      sesh.save!
      sesh.board.name.should == @board_attr[:name]
    end
    
    it "should set the user_id of the nested board" do
      sesh = Session.new(@attr.merge(board_attributes: @board_attr))
      sesh.save!
      sesh.board.user.should == sesh.user
    end
    
    it "should reject if the board name is blank" do
      sesh = Session.new(@attr.merge(board_attributes: { name: ''}))
      sesh.should be_valid
      sesh.board.should be_nil
    end
    
    it "should favor the board_id if both board_id and board_attributes are given" do
      sesh = Session.new(@attr.merge(board_id: @board.id, board_attributes: @board_attr))
      sesh.save!
      sesh.board.should == @board
    end
    
    it "should be valid if board_id is valid, and board_attributes are given but invalid" do
      sesh = Session.new(@attr.merge(board_id: @board.id, board_attributes: {name: ''}))
      sesh.save!
      sesh.board.should == @board
    end
  end
  
  describe "nested kites" do
    before(:each) do
      @attr = {
        date: Time.now,
        user: FactoryGirl.create(:user)
      }
      
      @kite_attr = {
        name: "Best Waroo"
      }
      
      @kite = FactoryGirl.create(:kite)
    end
    
    it "should accept parameters for a nested kite" do
      sesh = Session.new(@attr.merge(kite_attributes: @kite_attr))
      sesh.save!
      sesh.kite.name.should == @kite_attr[:name]
    end
    
    it "should set the user_id of the nested kite" do
      sesh = Session.new(@attr.merge(kite_attributes: @kite_attr))
      sesh.save!
      sesh.kite.user.should == sesh.user
    end
    
    it "should reject if the kite name is blank" do
      sesh = Session.new(@attr.merge(kite_attributes: { name: ''}))
      sesh.should be_valid
      sesh.kite.should be_nil
    end
    
    it "should favor the kite_id if both kite_id and kite_attributes are given" do
      sesh = Session.new(@attr.merge(kite_id: @kite.id, kite_attributes: @kite_attr))
      sesh.save!
      sesh.kite.should == @kite
    end
  end

end
