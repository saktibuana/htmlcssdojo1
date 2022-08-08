exam = {subject: "Matematika"}

# Tambahkan sebuah `if` dengan syarat berdasarkan nilai dari element dengan simbol :score
if exam[:score]
  puts "Nilai skor Anda untuk mata pelajaran #{exam[:subject]} adalah #{exam[:score]}%"
else
  puts "Nilai skor Anda untuk mata pelajaran #{exam[:subject]} belum dinilai"
end

exam = {subject: "Matematika", score: 80}
if exam[:score]
  puts "Nilai skor Anda untuk mata pelajaran #{exam[:subject]} adalah #{exam[:score]}%"
else
  puts "Nilai skor Anda untuk mata pelajaran #{exam[:subject]} belum dinilai"
end