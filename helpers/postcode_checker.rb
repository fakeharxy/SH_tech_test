
class PostcodeChecker
  API_URL = 'api.postcodes.io/postcodes'.freeze

  def initialize(postcode, postcode_fetcher)
    @postcode = postcode
    @postcode_fetcher = postcode_fetcher.new(postcode, API_URL)
  end
end
