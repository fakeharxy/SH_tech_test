require_relative '../../helpers/postcode_checker'

RSpec.describe PostcodeChecker do
  it 'returns true if the postcode fetcher returns Lambeth' do
    fetcher = double('fetcher', fetch: { 'result': { 'lsoa': 'Lambeth 005C'} })
    checker = PostcodeChecker.new('SW90LR', fetcher)
    expect(checker.whitelisted?).to be(true)
  end

  it 'returns true if the postcode fetcher returns Southwark' do
    fetcher = double('fetcher', fetch: { 'result': { 'lsoa': 'Southwark 005C'} })
    checker = PostcodeChecker.new('SW90LR', fetcher)
    expect(checker.whitelisted?).to be(true)
  end

  it 'returns false if the postcode fetcher returns Camden' do
    fetcher = double('fetcher', fetch: { 'result': { 'lsoa': 'Camden 005C'} })
    checker = PostcodeChecker.new('SW90LR', fetcher)
    expect(checker.whitelisted?).to be(false)
  end
end
