class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all 
    erb :index
  end
  
  get '/recipes/new' do
    erb :new
  end
 
  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredient: params[:ingredient], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end
  
  get '/recipes/:id' do 
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  en

end
