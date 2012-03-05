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
    
    it "should not be valid if the board name is blank" do
      sesh = Session.new(@attr.merge(board_attributes: { name: ''}))
      sesh.should_not be_valid
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
end
