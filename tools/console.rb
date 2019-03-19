require_relative '../config/environment.rb'


danko = User.new("Daniel")
tim = User.new("Tim")
sara = User.new("Sara")
gavin = User.new("Gavin")

spaghetti = Recipe.new("spaghetti")
ristrotto = Recipe.new("ristrotto")
pizza = Recipe.new("pizza")

noodles = Ingredient.new("noodles")
cheese = Ingredient.new("cheese")
parsley = Ingredient.new("parsley")
onion = Ingredient.new("onion")
parmesan = Ingredient.new("parmesan")

# di = RecipeIngredient.new(noodles, spaghetti)
spaghetti.add_ingredients([noodles, cheese, parsley])
ristrotto.add_ingredients([cheese, parsley])

r1 = RecipeCard.new("3/11", 89, danko, spaghetti)
r2 = RecipeCard.new("3/12", 92, danko, ristrotto)
r3 = RecipeCard.new("3/13", 91, danko, pizza)
r4 = RecipeCard.new("3/10", 90, danko, ristrotto)

danko.add_recipe_card("3/11", 60, spaghetti)
danko.declare_allergen(noodles)
sara.declare_allergen(cheese)
gavin.declare_allergen(cheese)
tim.declare_allergen(cheese)


binding.pry
