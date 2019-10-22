require 'httparty'
class PostcodeFetcher
  def self.fetch(postcode, url)
    HTTParty.get("#{url}/#{postcode}")
  end
end
