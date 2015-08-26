require('spec_helper')


describe('the recipe path', {:type => :feature}) do
  it('allow user to select a recipe') do
    recipe = Recipe.create({:name => "Cream Cheese Bagel", :ingredient => "Bagels, Cream Cheese", :instruction => "Toast bagel, spread cream cheese."})
    visit('/')
    expect(page).to have_content("Cream Cheese Bagel")
  end

  it('brings user to recipe creation form') do
    visit('/')
    click_link('Add a Recipe')
    expect(page).to have_content("Add new recipe")
  end

  it('allows user to delete a recipe') do
    recipe = Recipe.create({:name => "Cream Cheese Bagel", :ingredient => "Bagels, Cream Cheese", :instruction => "Toast bagel, spread cream cheese."})
    visit("/recipes/#{recipe.id}")
    click_button('Delete Recipe')
    expect(page).to have_content("Recipe Book")
  end
end
