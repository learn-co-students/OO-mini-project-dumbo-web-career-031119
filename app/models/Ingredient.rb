class Ingredient
  attr_accessor :allergen
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @allergen = false
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    allergen_count.max_by{|allergen,count| count}[0]
  end

  def self.allergen_count
    allergen_counts = {}
    all_allergens = all.select { |ingredient| ingredient.allergen }
    all_allergens.uniq.each do |allergen|
      allergen_counts[allergen] = all_allergens.count(allergen)
    end
    allergen_counts
  end

end
