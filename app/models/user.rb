class User < ActiveRecord::Base
  has_and_belongs_to_many :locations
  
  def self.authenticate_safely(email, password)
        find(:first, :conditions => [ "email = ? AND password = ?", 
  email, password ])
  end
end
