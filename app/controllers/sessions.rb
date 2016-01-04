# get '/login' do

#   erb :login
# end

# post '/login' do
# #checking password
# # uses session[:user_id]
# end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(name: params[:user][:name])
  if @user && @user.password == params[:user][:password]
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    redirect "/sessions/new"
  end
end

delete '/sessions' do
  session.clear
  redirect '/'
end




