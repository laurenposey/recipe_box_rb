require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/ingredient')
require('./lib/recipe')
require('./lib/tag')
also_reload('lib/**/*.rb')
require('pg')

get('/') do
  erb(:index)
end
