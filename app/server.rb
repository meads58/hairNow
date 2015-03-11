require 'data_mapper'
require 'sinatra'
require './app/model/clients.rb'
# require_relative 'controller/new.rb'
require_relative 'data_mapper_setup'

class HairNow < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "views") }
  set :public_folder, Proc.new { File.join(root, '..', "public") }

  enable :sessions
  set :session_secret, 'super secret'

get '/' do
  erb :index
end

get '/client/new' do
  @client = Client.new
  erb :new_client
end

post '/client/new' do
  @client = Client.create(:first_name =>params[:first_name],
                          :second_name =>params[:second_name],
                          :phone =>params[:phone],
                          :email =>params[:email],
                          :password =>params[:password],
                          :password_confirmation =>params[:password_confirmation]
                          )
  if @client.save
    session[:client_id] = @client.id
    redirect to('/')
  else
    erb :new_client
  end
end

get '/sessions/new' do
   erb :"sessions/new"
 end

 post '/sessions' do
   email, password = params[:email], params[:password]
   client = Client.authenticate(email, password)
   if client
     session[:client_id] = client.id
     redirect to('/')
   else
     # flash[:errors] = ["The user name or password is incorrect"]
     erb :"sessions/new"
   end
 end

 delete '/sessions' do
   # flash[:notice] = "You are signed out"
  session[:client_id] = nil
  redirect to('/')
 end

  helpers do

    def current_user
      @current_user ||=Client.get(session[:client_id]) if session[:client_id]
    end
  end

end