class Location < ActiveRecord::Base
  has_many :restaurants

  attr_accessor :city, :latitude, :longitude, :state
end
