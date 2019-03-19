class Recipe

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def users
    recipecards_arr = RecipeCard.all.select do |card|
      card.recipe == self
    end

    users_arr = recipecards_arr.map do |card|
      card.user
    end
  end

  def self.most_popular
    Recipe.all.sort_by {|recipe| RecipeCard.all.find_all{|recipecard| recipecard.recipe == recipe}.length}.last
  end

  def ingredients
    ri_arr = RecipeIngredient.all.select do |ri|
      ri.recipe == self
    end

    ingredients_arr = ri_arr.map do |ri|
      ri.ingredient
    end

  end

  def allergens
    allergen_with_ingredients = Allergen.all.map do |allergen|
      allergen.ingredient
    end

    allergen_with_ingredients & ingredients
  end

  def add_ingredients(ingredients_arr)
    ingredients_arr.each do |ingredient|
      RecipeIngredient.new(ingredient, self)
    end
  end

end
