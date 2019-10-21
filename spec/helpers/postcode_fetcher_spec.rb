require_relative '../../helpers/postcode_fetcher'

RSpec.describe PostcodeFetcher do
  it 'fetches information on a postcode' do
    stub_request(:get, 'https://api.postcodes.io/postcodes/SW90LR')
      .with(headers: { 'Accept' => '*/*', 'User-Agent' => 'Ruby' })
    fetcher = PostcodeFetcher.new('SW90LR', 'https://api.postcodes.io/postcodes')
    expect(fetcher.response).to be_success
  end
end
