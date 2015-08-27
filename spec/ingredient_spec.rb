require('spec_helper')

describe(Ingredient) do
  describe('#recipes') do
    it('return the recipes that include a given ingredient') do
      recipe1 = Recipe.create({:name => 'Lasagna', :instruction => 'Layer noodles with cheese and sauce.'})
      recipe2 = Recipe.create({:name => 'Pizza', :instruction => 'Put cheese and sauce on crust.'})
      ingredient = Ingredient.create({:name => 'Sauce'})
      ingredient.recipes().push(recipe1)
      ingredient.recipes().push(recipe2)
      expect(ingredient.recipes()).to(eq([recipe1, recipe2]))
    end
  end

  it('capitalizes the ingredient input') do
    ingredient = Ingredient.create({:name => 'sauce'})
    expect(ingredient.name()).to(eq('Sauce'))
  end
end
