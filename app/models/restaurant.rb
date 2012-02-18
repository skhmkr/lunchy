class Restaurant < ActiveRecord::Base
  validates :title, :length => { :maximum => 50, :minimum => 1 }
  validates :address, :length => { :maximum => 200, :minimum => 1 }
  validates :link, :length => { :maximum => 100, :minimum => 1 }
  
  belongs_to :user
end
