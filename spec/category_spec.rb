require('spec_helper')

describe(Category) do
  describe('#recipes') do
    it('return the categories that the recipe fits into') do
      category = Category.create({:name => 'Mexican'})
      recipe1= Recipe.create({:name => 'Tortilla Soup', :ingredient => 'Water, Oil, Tortillas, Corn, Rice, Beans', :instruction => 'Bring water to a boil. Cook rice and beans and corn. Mix everything together.'})
      category.recipes.push(recipe1)
      recipe2= Recipe.create({:name => 'Enchiladas', :ingredient => 'Tortilla, beans, cheese, rice, steak', :instruction => 'Cook all ingredients and roll into a tortilla. Pour delicious sauce over top.'})
      category.recipes.push(recipe2)
      expect(category.recipes()).to(eq([recipe1, recipe2]))
    end
  end
end
