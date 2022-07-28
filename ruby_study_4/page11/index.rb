class Menu
  attr_accessor :name
  attr_accessor :price
  
  # Definisikan method `initialize`
  def initialize
  self.name="Pizza"
  self.price=8
  def info
    return "#{self.name} $#{self.price}"
  end
end
end

menu1 = Menu.new

# Cetak nilai return dari method instance `info` dari instance `menu1`
puts menu1.info
