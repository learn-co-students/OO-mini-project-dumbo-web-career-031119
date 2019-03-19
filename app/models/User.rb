class User
  attr_reader :allergens
  @@all = []
  @@allergens = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.select {|recipeCard| recipeCard.user == self}.map {|recipeCard| recipeCard.recipe}
  end

  def add_recipe_card(recipe, rating, time)
    RecipeCard.new(self, recipe, rating, time)
  end

  def declare_allergen(ingredient)
    #should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
    @@allergens << Allergen.new(ingredient, self)
  end

  def allergens
    @@allergens.select { |allergen| allergen.user == self }
  end

  def top_three_recipes
    recipes.sort_by {|recipe| recipe.rating}[0..2]
  end

  def most_recent_recipe
    recipes.last
  end

end
