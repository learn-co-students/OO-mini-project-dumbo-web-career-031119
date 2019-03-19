require_relative '../config/environment.rb'

cake = Recipe.new("Cake")
lasagna = Recipe.new("Lasagna")
pie = Recipe.new("Pie")
omelette = Recipe.new("Omelette")

mike = User.new("Mike")
serena = User.new("Serena")

sugar = Ingredient.new("sugar")
egg = Ingredient.new("egg")
pasta = Ingredient.new("pasta")
tomato = Ingredient.new("tomato")

cake_ingredients = [sugar, egg]
lasagna_ingredients = [pasta, tomato]

cake.add_ingredients(cake_ingredients)
lasagna.add_ingredients(lasagna_ingredients)

mike_cake = mike.add_recipe_card(cake, 5, Time.now)
mike_lasagna = mike.add_recipe_card(lasagna, 4, Time.now)
mike_pie = mike.add_recipe_card(pie, 3, Time.now)
mike_omelette = mike.add_recipe_card(omelette, 2, Time.now)


serena_cake = serena.add_recipe_card(cake, 4, Time.now)
serena_lasagna = serena.add_recipe_card(lasagna, 4, Time.now)

mike.declare_allergen(sugar)
serena.declare_allergen(sugar)

binding.pry
