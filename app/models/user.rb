class User < ActiveRecord::Base
  attr_accessible :name, :email, :password
  has_many :locations
  
  private
  
  def encrypt_password
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    string # Only a temporary implementation!
  end
  
  def self.authenticate_safely(email, password)
    #fix this
    self.first(:conditions => [ "email = ?", email])
  end 
end
