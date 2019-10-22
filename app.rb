require 'sinatra'
require 'mongoid'
require_relative './helpers/postcode_helper'
require_relative './models/custom_whitelist'

Mongoid.load! 'mongoid.config'

helpers Sinatra::PostcodeHelper

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


