require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


 # code actions here!

get '/recipes' do 
  
  @recipes = Recipe.all
  erb :index
  end



get '/recipes/new' do 
erb :new
end

get '/recipes/:id/edit' do
  @recipe = Recipe.find_by_id(params[:id])
  erb :edit
end

post '/recipes' do

@recipe2 = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])


redirect to "/recipes/#{@recipe.id}"

end

patch '/recipes/:id' do 
  
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.name = params[:name]
  @recipe.ingredients = params[:ingredients]
 @recipe.save
 redirect to '/recipes/:id'
end

  get '/recipes/:id' do
  
  @recipe = Recipe.find_by_id(params[:id])
  erb :show

end

delete '/recipes/:id' do #destroy action
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.delete
  redirect to '/recipes'
end


end
