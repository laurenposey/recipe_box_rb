require('spec_helper')

describe(Recipe) do
  describe('#tags')do
    it("tells you what tags area associated with the recipe") do
      test_tag = Tag.create({:name => "Thai"})
      test_tag1 = Tag.create({:name => "Indian"})
      test_tag2 = Tag.create({:name => "Middle Eastern"})
      test_recipe = Recipe.create({:name => "noodles"})
      test_recipe.tags.push(test_tag1)
      test_recipe.tags.push(test_tag)


    expect(test_recipe.tags()).to(eq([test_tag, test_tag1]))
    end
  end

  describe('#ingredients')do
    it("tells you what ingrdients area associated with the recipe") do
      test_ingredient = Ingredient.create({:name => "basil"})
      test_ingredient1 = Ingredient.create({:name => "rosemary"})
      test_ingredient2 = Ingredient.create({:name => "oregano"})
      test_recipe = Recipe.create({:name => "alfredo sauce"})
      test_recipe.ingredients.push(test_ingredient1)
      test_recipe.ingredients.push(test_ingredient2)


    expect(test_recipe.ingredients()).to(eq([test_ingredient1, test_ingredient2]))
    end
  end

  
end
