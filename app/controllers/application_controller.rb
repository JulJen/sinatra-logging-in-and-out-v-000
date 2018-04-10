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
    puts params
    @user = Helpers.current_user(session)
    # @user = User.find_by(username: params["username"], password: params["password"])
    if @user
      # session[:user_id] = @user.id
      redirect '/account'
    else
      erb:error
    end
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
