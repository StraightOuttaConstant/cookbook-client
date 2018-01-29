require 'unirest'

require_relative "controllers/recipes_controller"
require_relative "views/recipes_views"
require_relative "models/recipe"

class Frontend
  include RecipesController
  include RecipesViews

  def run
    system "clear"

    puts "Welcome to my Cookbook App"
    puts "make a selection"
    puts "    [1] See all recipes"
    puts "        [1.1] Search all recipes"
    puts "        [1.2] Sort recipes by chef"
    puts "        [1.3] Sort recipes by prep time"
    puts "    [2] See one recipe"
    puts "    [3] Create a new recipe"
    puts "    [4] Update a recipe"
    puts "    [5] Destroy a recipe"

    input_option = gets.chomp

    if input_option == "1"
      recipes_index_action

    elsif input_option == "1.1"
      print "Enter a search term: "
      search_term = gets.chomp

      response = Unirest.get("http://localhost:3000/recipes?search=#{search_term}")
      products = response.body
      puts JSON.pretty_generate(products)  

    elsif input_option == "1.2"
      response = Unirest.get("http://localhost:3000/recipes?sort=chef")
      products = response.body
      puts JSON.pretty_generate(products) 
    elsif input_option == "1.3"
      response = Unirest.get("http://localhost:3000/recipes?sort=prep_time")
      products = response.body
      puts JSON.pretty_generate(products) 
    elsif input_option == "2"
      recipes_show_action
    elsif input_option == "3"
      recipes_create_action
    elsif input_option == "4"
      recipes_update_action
    elsif input_option == "5"
      recipes_destroy_action
    end
  end

private
  def get_request(url, client_params={})
    Unirest.get("http://localhost:3000#{url}", parameters: client_params).body
  end

  def post_request(url, client_params={})
    Unirest.post("http://localhost:3000#{url}", parameters: client_params).body
  end

  def patch_request(url, client_params={})
    Unirest.patch("http://localhost:3000#{url}", parameters: client_params).body
  end

  def delete_request(url, client_params={})
    Unirest.delete("http://localhost:3000#{url}", parameters: client_params).body
  end
end