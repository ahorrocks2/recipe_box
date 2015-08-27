require("spec_helper")
require('pry')
describe(Recipe) do
  describe('#categories') do
    it('return the categories that the recipe fits into') do
      category1 = Category.create({:name => 'Soups'})
      recipe_test = Recipe.create({:name => 'Tortilla Soup', :instruction => 'Bring water to a boil. Cook rice and beans and corn. Mix everything together.'})
      recipe_test.categories.push(category1)
      category2 = Category.create({:name => 'Mexican'})
      recipe_test.categories.push(category2)
      expect(recipe_test.categories()).to(eq([category1, category2]))
    end
  end

  describe('#ingredients') do
    it('returns the ingredients in a given recipe') do
      ingredient1 = Ingredient.create({:name => 'Noodles'})
      ingredient2 = Ingredient.create({:name => 'Ricotta'})
      recipe = Recipe.create({:name => 'Lasagna', :instruction => 'Layer noodles with cheese and sauce.'})
      recipe.ingredients().push(ingredient1)
      recipe.ingredients().push(ingredient2)
      expect(recipe.ingredients()).to(eq([ingredient1, ingredient2]))
    end
  end
end
