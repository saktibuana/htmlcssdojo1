# Lakukan `import` class `Date` menggunakan `require`
require "date"

# Tetapkan sebuah instance dari Date pada variable `birthday`
birthday = Date.new(1995,4,19)

# Cetak variable `birthday`
puts birthday

# Cetak nilai `return` dari method instance `sunday?` dari variable `birthday`
puts birthday.sunday?