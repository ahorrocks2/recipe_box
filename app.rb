require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

get('/recipe_form') do
  @categories = Category.all()
  erb(:recipe)
end

post('/recipes') do
  name = params.fetch("name")
  ingredient = params.fetch("ingredient")
  instruction = params.fetch("instruction")
  recipe = Recipe.create({:name => name, :ingredient => ingredient, :instruction => instruction})
  redirect('/')
end
