require 'unirest'

response = Unirest.get("http://localhost:3000/one_recipe_url")
recipe_data = response.body

puts JSON.pretty_generate(recipe_data)