class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # RESTful new action, displays create recipe form 
  get '/recipes/new' do
  erb :new 
  end
  
  # RESTful show action, displays one recipe based on ID in the url
  get '/recipes/:id' do 
   @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  
  # RESTful update action, modifies an existing recipe on id in the url. 
   patch '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end
  
    # RESTful route for all recipes
    get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  
  # RESTful create action, create one recipe 
    post '/recipes' do  #creates a recipe
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end
    
# RESTful delete action, deletes one recipe based on id in the url
     delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
  
  
    
end
