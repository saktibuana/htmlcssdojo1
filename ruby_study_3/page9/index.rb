def price_with_shipping(price)
  # Jika price lebih besar atau sama dengan 50, hasilkan nilai price tanpa penambahan
	if price >= 50
	  return price
	end
	  return price + 5
end
  
  # Tambahkan 5 pada price, lalu hasilkan nilai penjumlahannya
	

puts "Total harga adalah $30"
puts "Dengan ongkos kirim, totalnya menjadi $#{price_with_shipping(30)}"
puts "-----------"
puts "Total harga adalah $100"
puts "Dengan ongkos kirim, totalnya menjadi $#{price_with_shipping(100)}"
