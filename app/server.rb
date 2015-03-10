require 'data_mapper'
require 'sinatra'
require_relative 'data_mapper_setup'

class HairNow < Sinatra::Base

  set :root, File.dirname(__FILE__)

get '/' do

  erb :index
end

get '/user/new' do

    erb :new_user
  end

end