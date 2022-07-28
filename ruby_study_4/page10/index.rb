class Menu
  attr_accessor :name
  attr_accessor :price
  
  def info
    return "#{self.name} $#{self.price}"
  end
  
  # Define the get_total_price method
  def get_total_price(count)
    if count >= 3
      total_price = self.price * count
      return total_price = total_price - 1
    end
  end
  
end

menu1 = Menu.new
menu1.name = "Pizza"
menu1.price = 8

# Print the return value of the get_total_price method of the menu1 instance
puts menu1.get_total_price(3)

