class PostcodeChecker
  API_URL = 'https://api.postcodes.io/postcodes'.freeze
  WHITELISTED_LSOAS = %w[Southwark Lambeth].freeze

  def initialize(postcode, postcode_fetcher, custom_whitelist)
    @postcode = format_postcode(postcode)
    @response = postcode_fetcher.fetch(@postcode, API_URL)
    @custom_whitelist = custom_whitelist
  end

  def valid?
    @response['status'] != 404
  end

  def whitelisted?
    raise InvalidPostcodeError, 'Postcode was invalid' unless valid?

    return true if WHITELISTED_LSOAS.include? response_lsoa
    return true if @custom_whitelist.include? @postcode

    false
  end

  private

  def response_lsoa
    @response['result']['lsoa'].split(' ')[0]
  end

  def format_postcode(postcode)
    postcode
      .gsub(/\s+/, '')
      .downcase
  end
end

class InvalidPostcodeError < StandardError
  def initialize(message)
    super(message)
  end
end
