# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 五十嵐さん
User.create!(
  name: "Igarashi",
  email: "igarashi@igarashi",
  password: "123456789",
  password_confirmation: "123456789",
  telephone_number: "123456789",
  admin_flag: true
)

# 藤井さん
User.create!(
  name: "Fujii",
  email: "fujii@fujii",
  password: "11111111",
  password_confirmation: "11111111",
  telephone_number: "111111111",
  admin_flag: true
)

# 池上さん
User.create!(
  name: "Ikegami",
  email: "ikegami@ikegami",
  password: "000000000",
  password_confirmation: "000000000",
  telephone_number: "000000000",
  admin_flag: true
)

# しょーさん（顧客ユーザー）
User.create!(
  name: "しょーさん",
  email: "sho@sho",
  password: "22222222",
  password_confirmation: "22222222",
  telephone_number: "222222222"
)

# その他顧客ユーザー
20.times do |num|
  User.create(
    name: "顧客ユーザー#{num + 1}",
    email: "email#{num}@email",
    password: "password#{num}",
    password_confirmation: "password#{num}",
    telephone_number: "password#{num}",
  )
end

# ジャンル
Genre.create!(name: "ケーキ")
Genre.create!(name: "タルト")
Genre.create!(name: "チョコレート系")
Genre.create!(name: "季節系")