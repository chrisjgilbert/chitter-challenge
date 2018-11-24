require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(
      name: params[:name],
      email: params[:email],
      username: params[:username],
      password: params[:password]
    )
    redirect '/peeps'
  end

  run! if app_file == $0

end
