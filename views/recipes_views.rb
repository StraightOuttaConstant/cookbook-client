module RecipesViews
  def recipes_index_view(recipes)
    puts "*" * 70
    recipes.each do |recipe|
      recipes_show_view(recipe)
      puts "*" * 70
    end
  end

  def recipes_show_view(recipe)
    puts 
    puts recipe.title.upcase
    puts "=" * recipe.title.length
    puts "by: #{recipe.chef}".ljust(35) + "prep: #{recipe.prep_time}".rjust(35)
    puts
    puts "Ingredients"
    puts "-" * 70
    recipe.ingredients.each do |ingredient|
      puts "    • #{ingredient}"
    end
    puts
    puts "Directions"
    puts "-" * 70
    recipe.directions.each_with_index do |direction, index|
      puts "    #{index + 1}. #{direction}"
    end
    puts
  end
end