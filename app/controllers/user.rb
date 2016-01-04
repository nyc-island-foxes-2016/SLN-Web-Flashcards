# get user/new
# post users
# maybe user/:id

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
    #log in user and redirect to user page
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    #errors
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end
