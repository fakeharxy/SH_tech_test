require 'sinatra'
require 'mongoid'
require_relative './helpers/postcode_helper'
require_relative './models/custom_whitelist'

Mongoid.load! 'mongoid.config'

helpers Sinatra::PostcodeHelper

get '/' do
  erb :index
end

get '/custom_whitelist' do
  @custom_whitelist = CustomWhitelist.all
  erb :whitelist
end

post '/check' do
  begin
    whitelist_check(params['postcode']) ? (erb :accepted) : (erb :rejected)
  rescue InvalidPostcodeError
    erb :error
  end
end

post '/add_to_whitelist' do
  CustomWhitelist.create(postcode: params['whitelist_postcode'])
  redirect '/custom_whitelist'
end

get '/delete/:id' do
  CustomWhitelist.where(id: params['id']).delete
  redirect '/custom_whitelist'
end
