class Location < ActiveRecord::Base
  has_many :restaurants
  has_and_belongs_to_many :users
end
