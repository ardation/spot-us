require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PledgesController do
  describe "on POST to create with valid input" do
    before do
      login_as @user = Factory(:user)
      @tip = Factory(:tip)
    end
    
    it "should create a valid pledge" do
      do_create
      assigns[:pledge].should_not be_nil
      assigns[:pledge].should be_valid
    end

    it "should associate pledge with current user" do
      do_create
      assigns[:pledge].user_id.should == @user.id
    end

    it "should associate pledge with the tip" do
      do_create
      assigns[:pledge].tip.should == @tip
    end

    def do_create
      xhr :post, :create, :pledge => {:tip_id => @tip.id, :amount => 25}
    end
  end

  describe "on PUT to update with valid input" do
    before do
      login_as @user = Factory(:user)
      @tip = Factory(:tip, :user => @user)
      @pledge = @tip.pledges.first
    end
    
    it "should update the pledge" do
      do_update
      assigns[:pledge].should_not be_nil
      assigns[:pledge].should be_valid
      assigns[:pledge].amount.should == "75.0"
    end

    def do_update
      xhr :put, :update, :id => @pledge.id, :pledge => {:amount => 75}
    end
  end
end
