class RecipeCard

  attr_accessor :date, :rating, :user, :recipe

  @@recipecards = []

  def initialize(date, rating, user, recipe)
    @date = date
    @rating = rating
    @user = user
    @recipe = recipe
    @@recipecards << self
  end

  def self.all
    @@recipecards
  end

end
