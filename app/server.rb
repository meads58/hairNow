require 'data_mapper'
require 'sinatra'
# require_relative 'data_mapper_setup'


class HairNow < Sinatra::Base


  env = ENV['RACK_ENV'] || 'development'

  DataMapper.setup(:default, "postgres://localhost/hair_now_#{env}")

  require './app/model/clients.rb'

  DataMapper.finalize #after declaring models this finalises them

  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "views") }
  set :public_folder, Proc.new { File.join(root, '..', "public") }

get '/' do
  erb :index
end

get '/client/new' do
  @client = Client.new
  erb :new_client
end

post '/client/new' do
  @client = Client.create(:first_name =>params[:first_name],
    :last_name =>params[:last_name],
    :email => params[:email],
    :phone =>params[:phone],
    :password =>params[:password],
    :password_confirmation =>params[:password_confirmation])

  erb :new_client
end

end