require 'sinatra/base'
require_relative './postcode_fetcher'
require_relative './postcode_checker'

module Sinatra
  module CheckPostcode
    def whitelist_check(postcode)
      PostcodeChecker.new(postcode, PostcodeFetcher).whitelisted?
    end
  end
end
