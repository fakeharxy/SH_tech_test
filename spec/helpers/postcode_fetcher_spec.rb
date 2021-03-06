require_relative '../../helpers/postcode_fetcher'

RSpec.describe PostcodeFetcher do
  it 'fetches information on a postcode' do
    stub_request(:get, 'https://api.postcodes.io/postcodes/SW90LR')
      .with(headers: { 'Accept' => '*/*', 'User-Agent' => 'Ruby' })
    response = PostcodeFetcher.fetch('SW90LR', 'https://api.postcodes.io/postcodes')
    expect(response).to be_success
  end
end
