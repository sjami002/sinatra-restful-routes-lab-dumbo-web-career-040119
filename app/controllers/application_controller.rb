class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  
  get '/' do
    redirect to "/recipes"
  end
  
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  
  get '/recipes/new' do
    @recipes = Recipe.new
    erb :new
  end
  
  post '/recipes' do
    @recipes = Recipe.create(params)
    redirect to "/recipes/#{@recipes.id}"
  end
  
  get '/recipes/:id' do
    @recipes = Recipe.find_by_id(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do
    @recipes = Recipe.find_by_id(params[:id])
    erb :edit
  end
  
  patch '/recipes/:id' do
    @recipes = Recipe.find_by_id(params[:id])
    @recipes.update(params[:recipe])
    redirect to "/recipes/#{@recipes.id}"
  end
  
  delete '/recipes/:id' do
    Recipe.destroy(params[:id])
  end
  

end
