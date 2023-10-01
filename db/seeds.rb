# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Igarashi",
       email: "igarashi@igarashi",
       password: "123456789",
       password_confirmation: "123456789",
       telephone_number: "123456789",
       admin_flag: true)
       
User.create!(name: "Fujii",
       email: "fujii@fujii",
       password: "11111111",
       password_confirmation: "11111111",
       telephone_number: "111111111",
       admin_flag: true)
       
User.create!(name: "Ikegami",
       email: "ikegami@ikegami",
       password: "000000000",
       password_confirmation: "000000000",
       telephone_number: "000000000",
       admin_flag: true)
       
Genre.create!(name: "タルト")
Genre.create!(name: "チョコレート系")
Genre.create!(name: "季節系")
Genre.create!(name: "ケーキ")