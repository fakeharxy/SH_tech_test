class PostcodeChecker
  API_URL = 'https://api.postcodes.io/postcodes'.freeze
  WHITELISTED_LSOAS = %w[Southwark Lambeth].freeze

  def initialize(postcode, postcode_fetcher)
    @postcode = format_postcode(postcode)
    @response = postcode_fetcher.fetch(@postcode, API_URL)
  end

  def valid?
    @response['status'] != 404
  end

  def whitelisted?
    if valid?
      WHITELISTED_LSOAS.include? response_lsoa
    else
      raise InvalidPostcodeError.new('Postcode was invalid')
    end
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
