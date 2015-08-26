require("spec_helper")
require('pry')
describe(Recipe) do
  describe('#categories') do
    it('return the categories that the recipe fits into') do
      category1 = Category.create({:name => 'Soups'})
      recipe_test = Recipe.create({:name => 'Tortilla Soup', :ingredient => 'Water, Oil, Tortillas, Corn, Rice, Beans', :instruction => 'Bring water to a boil. Cook rice and beans and corn. Mix everything together.'})
      recipe_test.categories.push(category1)
      category2 = Category.create({:name => 'Mexican'})
      recipe_test.categories.push(category2)
      expect(recipe_test.categories()).to(eq([category1, category2]))
    end
  end
end
