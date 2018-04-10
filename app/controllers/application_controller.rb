require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params["username"], password: params["password"])

    if @user
      session[:user_id] = @user.user_id
      redirect '/account'
    end
    erb:error
  end

  get '/account' do
    @user = Helpers.current_user(session)
    if @user
      erb :account
    end
    erb:error
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
