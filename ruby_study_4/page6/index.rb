class Menu
  attr_accessor :name
  attr_accessor :price
end

menu1 = Menu.new

menu1.name = "Pizza"
puts menu1.name

menu1.price = 8
puts menu1.price

# Assign an instance of Menu to the menu2 variable
menu2 = Menu.new

# Assign "Sushi" to the name of the menu2 instance
menu2.name = "Sushi"

# Print the name of the menu2 instance
puts menu2.name

# Assign 10 to the price of the menu2 instance
menu2.price = 10

# Print the price of the menu2 instance
puts menu2.price
