require 'oauth'
require 'uri'
class V2
  
  attr_accessor :consumer_key, :consumer_secret, :token, :token_secret
    
  def initialize(consumer_key, consumer_secret, token, token_secret)
    @consumer_key, @consumer_secret, @token, @token_secret = 
      consumer_key, consumer_secret, token, token_secret
    
    api_host = 'api.yelp.com'
    consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
    @access_token = OAuth::AccessToken.new(consumer, token, token_secret)
  end
  
  def search(search, location)
    uri_location, uri_search = URI.encode(location), URI.encode(search)
    path = "/v2/search?term=#{uri_search}&location=#{uri_location}"
    JSON.parse(@access_token.get(path).body)
  end

end