require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  @categories = Category.all()
  erb(:index)
end

#-------------------------------------------------------#
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
  @categories = Category.all()
  erb(:recipe)
end

patch('/recipes/:id') do
  category = Category.find(params.fetch("category_id"))
  @recipe = Recipe.find(params.fetch('id'))
  @recipe.categories.push(category)
  redirect("/recipes/#{@recipe.id}")
end

delete('/recipes/:id') do
  id = params.fetch("id").to_i()
  @recipe = Recipe.find(id)
  @recipe.destroy()
  redirect("/")
end
#-------------------------------------------------------#
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
  @recipes = Recipe.all()
  erb(:category)
end

patch('/categories/:id') do
  recipe = Recipe.find(params.fetch('recipe_id'))
  @category = Category.find(params.fetch('id').to_i())
  @category.recipes.push(recipe)
  redirect("/categories/#{@category.id}")
end

delete('/categories/:id') do
  id = params.fetch("id").to_i()
  @category = Category.find(id)
  @category.destroy()
  redirect("/")
end
