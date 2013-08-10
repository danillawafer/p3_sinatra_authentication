get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  # sign-in
end

delete '/sessions/:id' do
  session[:user_id] = nil
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  p params
  # sign-up a new user
  User.create(params[:user])
  redirect '/sessions/new'
end

