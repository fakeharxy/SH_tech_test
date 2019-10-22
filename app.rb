require 'sinatra'
require_relative './helpers/check_postcode'

helpers Sinatra::CheckPostcode

get '/' do
  erb :index
end

post '/check' do
  whitelist_check(params['postcode']) ? (erb :accepted) : (erb :rejected)
end
