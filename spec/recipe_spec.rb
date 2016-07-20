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
end
