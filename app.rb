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
  recipe = Recipe.create({:name => name, :instruction => nil})
  redirect('/')
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch('id').to_i())
  @categories = Category.all()
  erb(:recipe)
end

patch('/recipes/:id') do
  instruction = params.fetch("instruction")
  @recipe = Recipe.find(params.fetch('id'))
  @recipe.update({:instruction => instruction})
  redirect("/recipes/#{@recipe.id}")
end

patch('/recipes/:id/edit') do
  @recipe = Recipe.find(params.fetch("id"))
  ingredient_name = params.fetch('ingredient_name')
  new_ingredient = Ingredient.find_or_create_by({:name => ingredient_name})
  unless @recipe.ingredients().find_by({:name => ingredient_name})
    @recipe.ingredients().push(new_ingredient)
  end
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
#---------------------------------------------------------------------#

get("/ingredients") do
  @recipes = Recipe.all()
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

get("/ingredients/:id") do
  @ingredient = Ingredient.find(params.fetch('id'))
  erb(:ingredient)
end
