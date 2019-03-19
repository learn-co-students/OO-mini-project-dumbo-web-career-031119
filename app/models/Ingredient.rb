class Ingredient

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    Ingredient.all.sort_by {|ingredient| Allergen.all.find_all{|allergen| allergen.ingredient == ingredient}.length}.last
  end

end
