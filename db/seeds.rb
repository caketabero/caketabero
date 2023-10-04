# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


########## ユーザー
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


########## ジャンル
Genre.create!(name: "All")
Genre.create!(name: "ケーキ")
Genre.create!(name: "タルト")
Genre.create!(name: "チョコレート系")
Genre.create!(name: "季節系")
Genre.create!(name: "その他")
Genre.create!(name: "未選択")

########## ケーキ一覧の配列
cakes = [
  # ケーキ
  [
    'ミルクレープ',
    'ショートケーキ',
    'レアチーズケーキ',
    'ベイクドチーズケーキ'
  ],

  # タルト
  [
    'チーズタルト',
    'チョコレートタルト',
    '3種のベリータルト',
    '生チョコタルト',
    'チーズタルト',
    'エッグタルト',
    'プリンタルト',
    'タルトタタン'
  ],

  # チョコレート系
  [
    'チョコレートケーキ',
    'フォンダンショコラ',
    'ガトーショコラ',
    '生チョコケーキ'
  ],

  # 季節系
  [
    'ブッシュドノエル',
    'モンブラン',
    '桃のケーキ',
    'マスカットのケーキ'
  ],

  # その他
  [
    'パウンドケーキ',
    'ティラミス',
    'アップルパイ',
    'レモンパイ',
    'パンプキンパイ',
    'シュークリーム',
    'プリン',
    'エクレア'
  ]
]

cakes.each_with_index do |genre_cakes, i|
  if i == 3
    k = 3 # 季節系ケーキの制作者はひろきさん
  elsif i == 4
    k = 1 # その他のケーキの制作者は一稀さん
  else
    k = i+1
  end

  genre_cakes.each_with_index do |cake, j|
    Cake.create(
      user_id: k,
      genre_id: i+2, # Allジャンルが存在する為
      cake_name: cake,
      explanation: "#{cake}の説明です。",
      stock: 20,
      cost: 300 + i * 100,
      created_name: User.find(i+1).name,
      updated_name: User.find(i+1).name
    )
  end
end