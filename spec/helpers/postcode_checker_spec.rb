require_relative '../../helpers/postcode_checker'

RSpec.describe PostcodeChecker do
  it 'returns true if the postcode fetcher returns Lambeth' do
    fetcher = double_maker('Lambeth')
    checker = PostcodeChecker.new('SW90LR', fetcher)
    expect(checker.whitelisted?).to be(true)
  end

  it 'returns true if the postcode fetcher returns Southwark' do
    fetcher = double_maker('Southwark')
    checker = PostcodeChecker.new('SW90LR', fetcher)
    expect(checker.whitelisted?).to be(true)
  end

  it 'returns false if the postcode fetcher returns Camden' do
    fetcher = double_maker('Camden')
    checker = PostcodeChecker.new('SW90LR', fetcher)
    expect(checker.whitelisted?).to be(false)
  end

  it 'returns an error if the postcode is not recognised' do
    fetcher = double('fetcher',
                     fetch: {
                       'status' => 404,
                       'error' => 'Invalid postcode'
                     })
    checker = PostcodeChecker.new('hhh3333', fetcher)
    expect(checker.valid?).to be(false)
  end
end

def double_maker(location)
  double('fetcher',
         fetch: {
           'result' =>
           { 'lsoa' => "#{location} 005C" }
         })
end
