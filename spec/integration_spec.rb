require('spec_helper')


describe('the recipe path', {:type => :feature}) do
  it('allow user to select a recipe') do
    recipe = Recipe.create({:name => "Cream Cheese Bagel", :instruction => nil})
    visit('/')
    expect(page).to have_content("Cream Cheese Bagel")
  end

  it('brings user to recipe creation form') do
    visit('/')
    click_link('Add a Recipe')
    expect(page).to have_content("Add new recipe")
  end

  it('allowes a user to add instruction to recipe') do
    recipe = Recipe.create({:name => "Cream Cheese Bagel", :instruction => nil})
    visit("/recipes/#{recipe.id}")
    fill_in("instruction", :with => "Toast bagel, spread cream cheese.")
    click_button("Update Instructions")
    expect(page).to have_content("Toast bagel, spread cream cheese.")
  end

  it('allows a user to add an ingredient') do
    recipe = Recipe.create({:name => "Cream Cheese Bagel", :instruction => "Toast bagel, spread cream cheese."})
    visit("/recipes/#{recipe.id}")
    fill_in("ingredient_name", :with => "Cream Cheese")
    click_button("Add an Ingredient")
    expect(page).to have_content("Cream Cheese")
  end

  it('allows user to delete a recipe') do
    recipe = Recipe.create({:name => "Cream Cheese Bagel", :instruction => "Toast bagel, spread cream cheese."})
    visit("/recipes/#{recipe.id}")
    click_button('Delete Recipe')
    expect(page).to have_content("Recipe Book")
  end
end
