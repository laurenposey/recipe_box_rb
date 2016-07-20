require('spec_helper')

describe(Ingredient) do
  describe('#recipes')do
    it("tells you what recipes are associated with the ingredient") do
      test_ingredient = Ingredient.create({:name => "Olive Oil"})
      test_recipe = Recipe.create({:name => "Brocolli Soup"})
      test_recipe2 = Recipe.create({:name => "salad roll"})
      test_recipe3 = Recipe.create({:name => "noodles"})
      test_ingredient.recipes.push(test_recipe)
      test_ingredient.recipes.push(test_recipe2)
    expect(test_ingredient.recipes()).to(eq([test_recipe, test_recipe2]))
    end
  end
end
