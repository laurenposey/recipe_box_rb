ENV['RACK_ENV']='test'
require("rspec")
require("pg")
require("sinatra/activerecord")
require('recipe')
require('tag')
require('ingredient')

RSpec.configure do |config|
  config.after(:each) do
    Tag.all().each() do |tag|
      tag.destroy()
    end
    Recipe.all().each() do |recipe|
      recipe.destroy()
    end
    Ingredient.all().each() do |ingredient|
      ingredient.destroy()
    end
  end
end
