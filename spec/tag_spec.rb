require('spec_helper')

describe(Tag) do
  describe('#recipes')do
    it("tells you what recipes are associated with the tag") do
      test_tag = Tag.create({:name => "Thai"})
      test_recipe = Recipe.create({:name => "curry"})
      test_recipe2 = Recipe.create({:name => "salad roll"})
      test_recipe3 = Recipe.create({:name => "noodles"})
      test_tag.recipes.push(test_recipe)
      test_tag.recipes.push(test_recipe2)
    expect(test_tag.recipes()).to(eq([test_recipe, test_recipe2]))
    end
  end
end
