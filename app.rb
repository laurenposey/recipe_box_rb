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
  erb(:recipe_form)
end

# Employee.new({:project_ids => [project1.id()]})

post('/recipes') do
  name = params.fetch('name')
  tag_ids = params.fetch('tag_ids')

  @recipe = Recipe.create({:name => name, :tag_ids => tag_ids})
binding.pry

  if @recipe.save()
    redirect to('/')
  else
    redirect('/recipe/new')
  end
end

get('/tag/new') do
  erb(:tag_form)
end

post('/tags') do
  name = params.fetch('name')
  @tag = Tag.create({:name => name})
  if @tag.save()
    redirect to('/')
  else
    redirect('/tag/new')
  end
end
