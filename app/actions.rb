# Homepage (Root path)

enable :sessions

helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  user_id = session[:user_id]
  if user_id
    @user = User.find(user_id)
  end
  erb :index
end


get '/songs' do
  @songs = Song.all
  erb :'/songs/index'
end

get '/songs/new' do
  if current_user
    erb :'/songs/new'
  else
    redirect '/users/login'
  end
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    author: params[:author],
    url: params[:url],
    user_id: current_user.id
    )
  if @song.save
    redirect "/songs"
  else
    erb :"/songs/new"
  end
end

get "/songs/:id" do
  @song = Song.find params[:id]
  erb :'/songs/show'
end

get '/users/new' do
  @user = User.new
  erb :'/users/new'
end

post '/users' do
  @user = User.create(params)
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'/users/new'
  end
end

get "/users/login" do
  erb :'/users/login'
end

post "/users/login" do
  user = User.find_by(email: params[:email])
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect '/'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end