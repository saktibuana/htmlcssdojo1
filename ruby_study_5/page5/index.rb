require "./food"
require "./drink"

food1 = Food.new(name: "Pizza", price: 8)
food1.calorie = 700

# Print the return value of the calorie_info instance method of the food1 instance
puts food1.calorie_info
