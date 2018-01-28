class Recipe
  attr_accessor :id, :title, :chef, :ingredients, :directions, :created_at, :prep_time
  def initialize(input_options)
      @id = input_options["id"]
      @title = input_options["title"]
      @chef = input_options["chef"]
      @ingredients = input_options["ingredients"]
      @directions = input_options["directions"]
      @created_at = input_options["created_at"]
      @prep_time = input_options["prep_time"]
  end
end