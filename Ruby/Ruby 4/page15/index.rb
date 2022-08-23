require "./menu"

menu1 = Menu.new(name: "Pizza", price: 8)
menu2 = Menu.new(name: "Sushi", price: 10)
menu3 = Menu.new(name: "Cola", price: 3)
menu4 = Menu.new(name: "Teh", price: 2)

menus = [menu1, menu2, menu3, menu4]
index = 0
# Tetapkan variable index menjadi 0


menus.each do |menu|
  # Cetak index dan info dari instance `menu`
  puts "#{index}. #{menu.info}"
  index += 1
  # Perbarui variable `index` dengan menambahkan 1 padanya.
end
