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
  category_id = params.fetch("category_id").to_i()
  recipe = Recipe.create({:name => name, :ingredient => ingredient, :instruction => instruction})
  recipe.update({:category_ids => category_id})
  redirect('/')
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  @categories = Category.all()
  erb(:recipe)
end

patch('/recipes/:id') do
  category_id = params.fetch("category_id").to_i()
  id = params.fetch("id").to_i()
  @recipe = Recipe.find(id)
  @recipe.update({:category_ids => category_id})
  redirect("/recipes/#{id}")
end

get('/category_form') do
  erb(:category_form)
end

post('/categories') do
  name = params.fetch("name")
  category = Category.create({:name => name})
  redirect('/')
end

get('/categories/:id') do
  @category = Category.find(params.fetch("id").to_i)
  erb(:category)
end
