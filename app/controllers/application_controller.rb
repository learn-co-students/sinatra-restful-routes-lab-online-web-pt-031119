class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # enable :sessions
    # set :session_secret, "password_security"
    
  end

  get '/' do  #homepage
    redirect to '/recipes'
  end 

  get '/recipes' do  #index   
    @recipes = Recipe.all
    #binding.pry 
    erb :index 
  end
  
  get '/recipes/new' do  #new
    #@recipe = Recipe.new             
    erb :new 
  end

  post '/recipes' do  #create
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"    
    erb :index
  end

  get '/recipes/:id' do  #show
    @recipes = Recipe.find(params[:id])
    erb :show 
  end

  get '/recipes/:id/edit' do  #edit 
    @recipe = Recipe.find_by_id(params[:id])     
    erb :edit 
  end

  patch '/recipes/:id' do  #update
    @recipe = Recipe.find_by_id(params[:id])    
    @recipe.name = params[:name]             
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]            
    @recipe.save                                
    # @recipe = Recipe.find_by_id(params[:id])     
    # @recipe.update(params[:article]) 
    redirect to "/recipes/#{@recipe.id}"
  end 

  delete '/recipes/:id' do  #delete    
    Recipe.destroy(params[:id])
    redirect to '/recipes' 
  end

  
  
   

  

end
