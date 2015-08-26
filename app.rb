require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  @categories = Category.all()
  erb(:index)
end

get('/recipe_form') do
  @categories = Category.all()
  erb(:recipe_form)
end

post('/recipes') do
  name = params.fetch("name")
  ingredient = params.fetch("ingredient")
  instruction = params.fetch("instruction")
  recipe = Recipe.create({:name => name, :ingredient => ingredient, :instruction => instruction})
  redirect('/')
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  erb(:recipe)
end

get('/category_form') do
  erb(:category_form)
end

post('/categories') do
  name = params.fetch("name")
  category = Category.create({:name => name})
  redirect('/')
end
