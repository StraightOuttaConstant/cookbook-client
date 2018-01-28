module RecipesController
  def recipes_index_action
    response = Unirest.get("http://localhost:3000/recipes")
    recipe_hashs = response.body
    recipes = []
    recipe_hashs.each do |recipe_hash|
      recipes << Recipe.new(recipe_hash)
    end
    recipes_index_view(recipes)
  end

  def recipes_create_action
    client_params = {}

    print "Title: "
    client_params[:title] = gets.chomp

    print "Chef: "
    client_params[:chef] = gets.chomp

    print "Ingredients: "
    client_params[:ingredients] = gets.chomp

    print "Directions: "
    client_params[:directions] = gets.chomp

    print "Prep Time: "
    client_params[:prep_time] = gets.chomp

    response = Unirest.post(
                            "http://localhost:3000/recipes",
                            parameters: client_params
                            )
    recipe_hash = response.body
    recipe = Recipe.new(recipe_hash)
    recipes_show_view(recipe)
  end

  def recipes_show_action
    print "Enter recipe id: "
    input_id = gets.chomp

    response = Unirest.get("http://localhost:3000/recipes/#{input_id}")
    recipe_hash = response.body
    recipe = Recipe.new(recipe_hash)
    recipes_show_view(recipe)
  end

  def recipes_update_action
    print "Enter recipe id: "
    input_id = gets.chomp

    response = Unirest.get("http://localhost:3000/recipes/#{input_id}")
    recipe_hash = response.body
    recipe = Recipe.new(recipe_hash)

    client_params = {}

    print "Title (#{recipe.title}): "
    client_params[:title] = gets.chomp

    print "Chef (#{recipe.chef}): "
    client_params[:chef] = gets.chomp

    print "Ingredients (#{recipe.ingredients}): "
    client_params[:ingredients] = gets.chomp

    print "Directions (#{recipe.directions}): "
    client_params[:directions] = gets.chomp

    print "Prep Time (#{recipe.prep_time}): "
    client_params[:prep_time] = gets.chomp

    client_params.delete_if { |key, value| value.empty? }

    response = Unirest.patch(
                            "http://localhost:3000/recipes/#{input_id}",
                            parameters: client_params
                            )
    recipe_hash = response.body
    recipe = Recipe.new(recipe_hash)
    recipes_show_view(recipe)
  end

  def recipes_destroy_action
    print "Enter recipe id: "
    input_id = gets.chomp

    response = Unirest.delete("http://localhost:3000/recipes/#{input_id}")
    data = response.body
    puts data["message"]
  end
end