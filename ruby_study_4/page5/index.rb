class Menu
  attr_accessor :name
  attr_accessor :price
end

menu1 = Menu.new

menu1.name = "Pizza"
puts menu1.name

# Assign 8 to the price of the menu1 instance
menu1.price = 8

# Print the price of menu1 instance
puts menu1.price

