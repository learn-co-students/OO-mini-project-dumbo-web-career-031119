class User

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    recipecards_arr = RecipeCard.all.select do |card|
      card.user == self
    end

    recipes_arr = recipecards_arr.map do |card|
      card.recipe
    end
  end

  def add_recipe_card(date, rating, recipe)
    new_recipe_card = RecipeCard.new(date, rating, self, recipe)
  end

  def declare_allergen(ingredient)
    new_allergen = Allergen.new(self, ingredient)
  end

  def allergens
    new_allergen_arr = Allergen.all.select do |allergen|
      allergen.user == self
    end

    ingredients_arr = new_allergen_arr.map do |allergen|
      allergen.ingredient
    end
  end

  def top_three_recipes
    recipecards_arr = RecipeCard.all.select do |card|
      card.user == self
    end

    new_arr = recipecards_arr.max_by(3) {|recipe| recipe.rating}

    # returning an array of recipes instead of recipe Cards
    new_arr.map do |card|
      card.recipe
    end
  end

  def most_recent_recipe
    recipes.last
  end

  def safe_recipes
    # if allergens.include?()
    new_arr = []
    allergens.each do |ingredient|
      RecipeIngredient.all.each do |ri|
        if ri.ingredient == ingredient
          if !new_arr.include?(ri.recipe)
            new_arr.push(ri.recipe)
          end
        end
      end
    end
    # the array with recipes with the user's allergens
    new_arr
    Recipe.all - new_arr
    # merged_arr - (Recipe.all & new_arr)
  end

end
