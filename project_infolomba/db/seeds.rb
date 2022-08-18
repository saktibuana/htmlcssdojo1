# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Generate User 
10.times do |i|
	User.create(name:"User genderate name##{i}",address:"RT10", gender:"Laki-laki", age: rand(15..40))
end

5.times do |i|
	User.create(name:"User genderate name##{i}",address:"RT5", gender:"Laki-laki", age: rand(15..40))
end

3.times do |i|
	User.create(name:"User genderate name##{i}",address:"RT3", gender:"Laki-laki", age: rand(15..40))
end

3.times do |i|
	User.create(name:"User genderate name##{i}",address:"RT5", gender:"Perempuan", age: rand(15..40))
end

# Generate Contest
Contest.create(name:"Panjat Pinang",description:"Panjat Pinang", maxcontestant:"50", status:true)
Contest.create(name:"Makan Kerupuk",description:"Makan Kerupuk", maxcontestant:"50", status:true)
Contest.create(name:"Balap Karung",description:"Balap Karung", maxcontestant:"50", status:true)
Contest.create(name:"Balap Kelereng",description:"Balap Kelereng", maxcontestant:"50", status:true)
Contest.create(name:"Sepak bola Sarung",description:"Sepak bola Sarung", maxcontestant:"50", status:true)
Contest.create(name:"Memasak",description:"Memasak", maxcontestant:"50", status:true)
Contest.create(name:"Makeup",description:"Makeup", maxcontestant:"50", status:true)
Contest.create(name:"Balap Getek",description:"Makeup", maxcontestant:"50", status:true)
Contest.create(name:"Pindah Bendera",description:"Makeup", maxcontestant:"50", status:true)
Contest.create(name:"Pindah Belut",description:"Makeup", maxcontestant:"50", status:true)
Contest.create(name:"Masukan Paku ke Botol",description:"Makeup", maxcontestant:"50", status:true)


#Generate Hadiah
Prize.create(name:"Sepeda",description:"Sepeda")
Prize.create(name:"Sendal",description:"Sepeda")
Prize.create(name:"Sepatu",description:"Sepeda")
Prize.create(name:"Kaos",description:"Sepeda")
Prize.create(name:"Lampu",description:"Sepeda")
Prize.create(name:"Voucer",description:"Sepeda")
Prize.create(name:"Blender",description:"Sepeda")
Prize.create(name:"Hadiah Hiburan 1",description:"Sepeda")
Prize.create(name:"Hadiah Hiburan 2",description:"Sepeda")


#Generate Daftar Peserta Lombar
Contestant.create(contest_id:1,user_id:1)
Contestant.create(contest_id:1,user_id:2)
Contestant.create(contest_id:1,user_id:3)
Contestant.create(contest_id:1,user_id:4)
Contestant.create(contest_id:2,user_id:5)
Contestant.create(contest_id:2,user_id:6)
Contestant.create(contest_id:2,user_id:7)
Contestant.create(contest_id:3,user_id:8)
Contestant.create(contest_id:3,user_id:9)
Contestant.create(contest_id:3,user_id:10)
Contestant.create(contest_id:4,user_id:11)
Contestant.create(contest_id:4,user_id:12)
Contestant.create(contest_id:5,user_id:13)
Contestant.create(contest_id:6,user_id:14)
Contestant.create(contest_id:6,user_id:15)

#Generate Pemenang Lomba
Winner.create(contest_id:1,user_id:1)
Winner.create(contest_id:2,user_id:2)
Winner.create(contest_id:3,user_id:3)
Winner.create(contest_id:4,user_id:15)
Winner.create(contest_id:5,user_id:20)
Winner.create(contest_id:6,user_id:21)
Winner.create(contest_id:7,user_id:4)
Winner.create(contest_id:8,user_id:7)
Winner.create(contest_id:9,user_id:8)
Winner.create(contest_id:10,user_id:12)
Winner.create(contest_id:11,user_id:14)
Winner.create(contest_id:11,user_id:16)













