# Import food.rb and drink.rb using require
require './food'
require './drink'

# Assign an instance of Food with the stated arguments to the food1 variable
food1 = Food.new(name:'Pizza', price:8)

# Print the return value of info method of the food1 instance
puts food1.info

# Assign an instance of Drink with the stated arguments to the drink1 variable
drink1 = Drink.new(name:'Cola', price:3)

# Print the return value of info method of the drink1 instance
puts drink1.info
