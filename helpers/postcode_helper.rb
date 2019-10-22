require 'sinatra/base'
require_relative './postcode_fetcher'
require_relative './postcode_checker'

module Sinatra
  module PostcodeHelper
    def whitelist_check(postcode)
      PostcodeChecker.new(postcode,
                          PostcodeFetcher,
                          custom_whitelist).whitelisted?
    end

    private

    def custom_whitelist
      CustomWhitelist.all.inject([]) do |array, whitelist|
        array << whitelist.postcode
      end
    end
  end
end
