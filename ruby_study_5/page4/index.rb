require "./food"
require "./drink"

food1 = Food.new(name: "Pizza", price: 8)
drink1 = Drink.new(name: "Cola", price: 3)

# Assign 700 to the calorie instance variable of food1
food1.calorie = 700

# Print the calorie instance variable of food1
puts food1.calorie


# Assign 500 to the volume instance variable of drink1
drink1.volume = 500


# Print the volume instance variable of drink1
puts drink1.volume
