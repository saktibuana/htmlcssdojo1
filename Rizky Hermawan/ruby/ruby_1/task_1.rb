number = 100

# Tambahkan sebuah pernyataan bersyarat
if number % 5 == 0 && number % 3 == 0
  puts "Ini adalah kelipatan dari 15"
elsif number % 5 == 0
  puts "Ini adalah kelipatan dari 5"
elsif number % 3 == 0
  puts "Ini adalah kelipatan dari 3"
else
  puts "Ini bukan kelipatan dari 3 atau 5"
end