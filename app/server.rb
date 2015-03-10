require 'data_mapper'
require 'sinatra'
require_relative 'data_mapper_setup'

class HairNow < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "views") }
  set :public_folder, Proc.new { File.join(root, '..', "public") }

get '/' do
  erb :index
end

get '/user/new' do

  erb :new_user
end

end