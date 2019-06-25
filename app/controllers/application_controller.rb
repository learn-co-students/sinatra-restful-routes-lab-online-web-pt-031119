class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # enable :sessions
    # set :session_secret, "password_security"
    
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index 
  end 

  get '/recipe/new' do
    
  end 

end
