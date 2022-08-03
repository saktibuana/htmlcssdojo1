class Menu
  attr_accessor :name
  attr_accessor :price
end

menu1 = Menu.new

menu1.name = "Pizza"
puts menu1.name

menu1.price = 8

# Cetak `price` dari instance `menu1`
puts menu1.price

