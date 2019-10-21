require 'httparty'
class PostcodeFetcher
  attr_reader :response

  def initialize(postcode, url)
    @response = HTTParty.get("#{url}/#{postcode}")
  end
end
