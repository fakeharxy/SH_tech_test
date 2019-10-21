require 'sinatra'
require_relative './helpers/check_postcode'

helpers Sinatra::CheckPostcode

get '/' do
  erb :index
end

post '/check/:postcode' do
  CheckPostcode::run(params['postcode'])
  erb :resultS
end
