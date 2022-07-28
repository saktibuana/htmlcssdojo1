class Menu
  attr_accessor :name
  attr_accessor :price
  
  def info
    # Return "The name and the price will be printed"
    return "The name and the price will be printed"
  end
end

menu1 = Menu.new
menu1.name = "Pizza"
menu1.price = 8

# Print the return value of the info instance method of the menu1 instance
puts menu1.info

