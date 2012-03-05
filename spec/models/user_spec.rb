require 'spec_helper'

describe User do
  before(:each) do 
    @attr = {
      email: "user@example.com",
      password: "password",
      password_confirmation: "password"
    }
  end
  
  it "should create a new instance given valid attrs" do
    User.create!(@attr)
  end

  describe "email addresses" do
    it "should require an email address" do
      no_email = User.new(@attr.merge(email: ''))
      no_email.should_not be_valid
    end
  
    it "should accept valid email addresses" do
      addresses = %w(user@email.com A_USER@some.email.net some.user@du.de)
      addresses.each do |address|
        u =  User.new(@attr.merge(email: address))
        u.should be_valid
      end
    end
  
    it "should reject invalid email addresses" do
      addresses = %w(user@email,com A_USER_some.email.net some.user@du.)
      addresses.each do |address|
        u =  User.new(@attr.merge(email: address))
        u.should_not be_valid
      end
    end

    it "should require that email addresses be unique" do
      User.create!(@attr)
      duplicate = User.new(@attr)
      duplicate.should_not be_valid
    end
  
    it "should reject email addresses that are the same except for case" do
      User.create!(@attr)
      duplicate = User.new(@attr.merge(email: @attr[:email].upcase))
      duplicate.should_not be_valid
    end
  end
  
  describe "passwords" do
    before(:each) do
      @user = User.new(@attr)
    end
    
    it "should be required" do
      User.new(@attr.merge(password: '', password_confirmation: '')).should_not be_valid
    end
    
    it "should require a matching confirmation" do
      User.new(@attr.merge(password_confirmation: "does not match")).should_not be_valid
    end
    
    it "should be longer than six characters" do
      too_short = "a" * 5
      User.new(@attr.merge(password: too_short, password_confirmation: too_short)).should_not be_valid      
    end
  end
end
