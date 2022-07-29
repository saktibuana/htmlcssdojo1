class Menu
  attr_accessor :name
  attr_accessor :price
  
  # Definisikan method `initialize`
  def initialize
    self.name = "Pizza"
    self.price = 8
  end
  
  def info
    return "#{self.name} $#{self.price}"
  end
  
  def get_total_price(count)
    total_price = self.price * count
    if count >= 3
      total_price -= 1
    end
    return total_price
  end
end

menu1 = Menu.new
puts menu1.info
# Cetak nilai return dari method instance `info` dari instance `menu1`

