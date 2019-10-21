require 'sinatra/base'
require_relative './postcode_fetcher'
require_relative './postcode_checker'

module Sinatra
  module CheckPostcode
    def run(postcode)
      PostcodeChecker.new(postcode, postcode_fetcher)
    end
  end
end
