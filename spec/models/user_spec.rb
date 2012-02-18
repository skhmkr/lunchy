describe User do
  before(:each) do
      @attr = { :name => "Example User", :email => "user@example.com" }
  end
  
  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end
  end
end