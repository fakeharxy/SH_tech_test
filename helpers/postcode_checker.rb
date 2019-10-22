class PostcodeChecker
  API_URL = 'https://api.postcodes.io/postcodes'.freeze
  WHITELISTED_LSOAS = %w[Southwark Lambeth].freeze

  def initialize(postcode, postcode_fetcher)
    @postcode = format_postcode(postcode)
    @response = postcode_fetcher.fetch(@postcode, API_URL)
  end

  def whitelisted?
    WHITELISTED_LSOAS.include? response_lsoa
  end

  private

  def response_lsoa
    @response["result"]["lsoa"].split(' ')[0]
  end

  def format_postcode(postcode)
    postcode
      .gsub(/\s+/, '')
      .downcase
  end
end
