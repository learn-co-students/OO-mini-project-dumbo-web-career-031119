class RecipeCard
  attr_reader :user, :recipe
  attr_accessor :date, :rating

  @@all = []

  def initialize(user, recipe, rating, date)
    @rating = rating
    @user = user
    @recipe = recipe
    @date = "#{date.year}-#{date.month}-#{date.day}"
    @@all << self
  end

  def self.all
    @@all
  end


end
