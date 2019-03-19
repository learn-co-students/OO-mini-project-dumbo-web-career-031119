class Recipe
  attr_reader :rating
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.recipe_count
    recipe_counts = {}    # {recipe => count}
    all_recipes = RecipeCard.all.map { |recipeCard| recipeCard.recipe }
    all_recipes.uniq.each do |recipe|
      recipe_counts[recipe] = all_recipes.count(recipe)
    end
    recipe_counts
  end

  def self.most_popular
    recipe_count.max_by{|recipe,count| count}[0]
  end

  def users
    RecipeCard.all.select { |recipeCard| recipeCard.recipe == self }
  end

  def ingredients
    RecipeIngredient.all.select { |recipeIngredient| recipeIngredient.recipe == self }.map {|recipeIngredient| recipeIngredient.ingredient}
  end

  def allergens
    ingredients.select { |ingredient| ingredient.allergen }
  end

  def add_ingredients(ingredients_arr)
    #should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
    ingredients_arr.each { |ingredient| RecipeIngredient.new(self, ingredient)}

  end

end
