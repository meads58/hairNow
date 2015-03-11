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