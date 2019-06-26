class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # enable :sessions
    # set :session_secret, "password_security"
    
  end

  get '/' do 
    redirect to '/recipes'
  end 

  get '/recipes' do  #homepage
    @recipes = Recipe.all
    #binding.pry 
    erb :index 
  end 

  get '/recipes/:id' do  #show
    @recipes = Recipe.find(params[:id])
    erb :show 
  end

end
