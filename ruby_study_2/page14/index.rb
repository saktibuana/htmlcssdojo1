characters = [
  {name: "Ninja Ken", age: 14},
  {name: "Guru Domba"},
  {name: "Baby Ben", age: 5},
  {name: "Birdie"}
]
Cetak = "---------------------------------"
# Cetak name dari variable characters menggunakan method `each`
characters.each do |character|
  puts "Nama saya adalah  #{character[:name]}"
  puts Cetak
end