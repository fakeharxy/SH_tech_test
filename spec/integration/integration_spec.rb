require_relative '../../helpers/postcode_checker'
require_relative '../../helpers/postcode_fetcher'
require File.expand_path '../integration_helper.rb', __dir__

RSpec.describe 'integration_spec' do
  it 'determines if a postcode is whitelisted' do
    VCR.use_cassette('integration_spec_1') do
      postcode_fetcher = PostcodeFetcher
      postcode_checker = PostcodeChecker.new('SW9 0LR', postcode_fetcher, [])
      expect(postcode_checker.whitelisted?).to eq(true)
    end
  end

  it 'determines a postcode is not whitelisted' do
    VCR.use_cassette('integration_spec_2') do
      postcode_fetcher = PostcodeFetcher
      postcode_checker = PostcodeChecker.new('HP14 4XW', postcode_fetcher, [])
      expect(postcode_checker.whitelisted?).to eq(false)
    end
  end

  it 'determines a postcode is invalid' do
    VCR.use_cassette('integration_spec_3') do
      postcode_fetcher = PostcodeFetcher
      postcode_checker = PostcodeChecker.new('CUSTOM', postcode_fetcher, [])
      expect(postcode_checker.valid?).to eq(false)
    end
  end
end
