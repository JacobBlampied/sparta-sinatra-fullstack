class UsersController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # setting the root as the parent directory of the current directory
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # INDEX
  get '/users' do
    @title = "Users" # @title?
    @users = User.all

    erb :'users/index'
  end

  # NEW
  get '/users/new' do
    erb :'users/new'
  end

  # SHOW
  get '/users/:id' do
    id = params[:id].to_i
    @user = User.find_with_director id

    erb :'users/show'
  end

  # CREATE
  post '/users' do

    user = User.new

    user.name = params[:name]
    user.job = params[:job]
    user.phone = params[:phone]

    user.save

    redirect '/users'

  end

  # UPDATE
  put '/users/:id' do
    id = params[:id].to_i

    user = User.find id

    user.name = params[:name]
    user.job = params[:job]
    user.phone = params[:phone]

    user.save

    redirect '/users'

  end

  # DELETE
  delete '/users/:id' do
    id = params[:id].to_i
    User.destroy id
    redirect '/users'
  end

  # EDIT
  get '/users/:id/edit' do
    id = params[:id].to_i
    @user = User.find id

    erb :'users/edit'
  end

end
