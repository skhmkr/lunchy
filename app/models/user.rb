class User < ActiveRecord::Base
  attr_accessible :name, :email, :encrypted_password
  has_many :restaurants
  
  validates :password, :presence     => true,
                         :confirmation => true,
                         :length       => { :within => 6..40 }
  
  before_save :encrypt_password
  
  private

  def encrypt_password
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    string # Only a temporary implementation!
  end
end
