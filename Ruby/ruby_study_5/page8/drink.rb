require "./menu"

class Drink < Menu
  attr_accessor :volume
  
   def initialize(name:, price:, volume:)
    self.name = name
    self.price = price
    self.volume = volume
  end
  
  def info
    return "#{self.name} $#{self.price} (#{self.volume}mL)"
  end
end
