require 'sinatra'
require_relative './helpers/check_postcode'

helpers Sinatra::CheckPostcode

get '/' do
  erb :index
end

post '/check' do
  begin
    whitelist_check(params['postcode']) ? (erb :accepted) : (erb :rejected)
  rescue InvalidPostcodeError
    erb :error
  end
end
