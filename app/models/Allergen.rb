class Allergen
  attr_reader :ingredient, :user

  @@all = []

  def initialize(ingredient, user)
    @user = user
    @ingredient = ingredient.name
    ingredient.allergen = true
    @@all << self
  end

  def self.all
    @@all
  end




end
