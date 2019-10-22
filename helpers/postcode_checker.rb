class PostcodeChecker
  API_URL = 'api.postcodes.io/postcodes'.freeze
  WHITELISTED_LSOAS = %w[Southwark Lambeth].freeze

  def initialize(postcode, postcode_fetcher)
    @postcode = postcode
    @response = postcode_fetcher.fetch(postcode, API_URL)
  end

  def whitelisted?
    WHITELISTED_LSOAS.include? response_lsoa
  end

  private

  def response_lsoa
    @response[:result][:lsoa].split(' ')[0]
  end
end
