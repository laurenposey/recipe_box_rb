require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/ingredient')
require('./lib/recipe')
require('./lib/tag')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

get('/recipe/new') do
  @tags = Tag.all()
  @ingredients = Ingredient.all()
  erb(:recipe_form)
end


post('/recipes') do
  name = params.fetch('name')
  tag_ids = params['tag_ids']
  ingredient_ids = params['ingredient_ids']
  ingredent_new = params.fetch("new_ingredient")
  instructions = params.fetch("instructions")
  rating = 0
  if ingredent_new == ''
    @recipe = Recipe.create({:name => name, :instructions => instructions,  :rating => rating, :tag_ids => tag_ids, :ingredient_ids => ingredient_ids})
    if @recipe.save()
      redirect to('/')
    else
      redirect('/recipe/new')
    end
  else
    name = params.fetch('new_ingredient')
    ingredient = Ingredient.create({:name => name})
    redirect to('/recipe/new')
  end
end

get('/tag/new') do
  @tags = Tag.all()
  erb(:tag_form)
end

post('/tags') do
  name = params.fetch('name')
  @tag = Tag.create({:name => name})
  redirect to('/tag/new')
end

get('/ingredients/new') do
  @ingredients = Ingredient.all()
  erb(:ingredient_form)
end

post("/ingredients")  do
  name = params.fetch('name')
  @ingredient = Ingredient.create({:name => name})
  redirect to('/ingredients/new')
end


delete('/ingredients/:id/delete') do
  id = params.fetch('id').to_i()
  ingredient_to_delete = Ingredient.find(id)
  ingredient_to_delete.delete()
  redirect('/ingredients/new')
end

get('/recipe/:id/edit') do
  @recipe = Recipe.find(params.fetch('id').to_i())
  @tags = Tag.all()
  @ingredients = Ingredient.all()
  erb(:recipe_edit)
end

get('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('id').to_i())
  erb(:recipe_card)
end

patch('/recipes/:id') do
  name = params.fetch('name')
  @recipe = Recipe.find(params.fetch('id').to_i())
  @recipe.update({:name => name})
  if @recipe.save()
    redirect to("/recipe/#{@recipe.id()}/edit")
  else
    redirect('/recipes/:id')
  end
end

delete('/recipes/:id/delete') do
  id = params.fetch('id').to_i()
  recipe_to_delete = Recipe.find(id)
  recipe_to_delete.delete()
  redirect('/')
end

delete('/tags/:id/delete') do
  id = params.fetch('id').to_i()
  tag_to_delete = Tag.find(id)
  tag_to_delete.delete()
  redirect('/tag/new')
end

patch('/tags/:id/remove/:recipe_id') do
  id = params.fetch('id').to_i()
  tag = Tag.find(id)
  recipe_id = params.fetch('recipe_id')
  recipe = Recipe.find(recipe_id)
  recipe.tags.destroy(tag)
  redirect to("/recipe/#{recipe_id}/edit")
end

patch('/tags/:id/add/:recipe_id') do
  id = params.fetch('id').to_i()
  tag = Tag.find(id)
  recipe_id = params.fetch('recipe_id')
  recipe = Recipe.find(recipe_id)
  recipe.tags.push(tag)
  redirect to("/recipe/#{recipe_id}/edit")
end

patch('/ingredients/:id/remove/:recipe_id') do
  id = params.fetch('id').to_i()
  ingredient = Ingredient.find(id)
  recipe_id = params.fetch('recipe_id')
  recipe = Recipe.find(recipe_id)
  recipe.ingredients.destroy(ingredient)
  redirect to("/recipe/#{recipe_id}/edit")
end

patch('/ingredients/:id/add/:recipe_id') do
  id = params.fetch('id').to_i()
  ingredient = Ingredient.find(id)
  recipe_id = params.fetch('recipe_id')
  recipe = Recipe.find(recipe_id)
  recipe.ingredients.push(ingredient)
  redirect to("/recipe/#{recipe_id}/edit")
end

patch("/update/:id/instructions") do
  recipe_id = params.fetch('id').to_i()
  instructions = params.fetch("instructions")
  recipe = Recipe.find(recipe_id)
  recipe.update({:instructions => instructions})
  redirect to("/recipe/#{recipe_id}/edit")
end

post('/recipe/:id/rating') do
  id = params.fetch('id').to_i()
  recipe = Recipe.find(id)
  rating = params.fetch('rating').to_i()
  recipe.update({:rating => rating})
  redirect to("/recipe/#{recipe.id}")
end
