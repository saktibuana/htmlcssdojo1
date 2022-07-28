characters = [
  {name: "Ken the Ninja", age: 14},
  {name: "Master Wooly"},
  {name: "Baby Ben", age: 5},
  {name: "Birdie"}
]

characters.each do |character|
  puts "--------------------"
  puts "My name is #{character[:name]}"
  
  # Print the character's age using the symbol :age
  if character[:age]
    puts "I am #{character[:age]} years old"
  else
    puts "My age is a secret"
  end
end
