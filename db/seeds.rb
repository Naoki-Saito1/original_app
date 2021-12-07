# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 5.times do |n|
#   User.create!(
#     user_name: "プログラアドミンナ#{n + 1}",
#     email: "admin#{n + 1}@test.com",
#     password:  "aaaaa#{n + 1}",
#     admin: true
#   )
# end


admin = User.create!(
  email: "test1@test.com",
  password:  "111111",
  admin: true
)

user1 = User.create!(
    email: "test1@test.com",
    password:  "111111"
  )


user2 = User.create!(
  email: "test2@test.com",
  password:  "222222"
)

user3 = User.create!(
  email: "test3@test.com",
  password:  "333333"
)

user4 = User.create!(
  email: "test4@test.com",
  password:  "444444"
)

user5 = User.create!(
  email: "test5@test.com",
  password:  "555555"
)

profile = admin.build_profile(
  name: "プログラミンナ",
  body: '初めましてよろしくお願い致します',
  gender: '男性',
  birth_date: '1996-01-01',
  address: '東京都'
  status: '転職活動中'
  detail: '特になし'
)
profile.save

profile1 = user1.build_profile(
    name: "プログラミンナ1",
    body: '初めましてよろしくお願い致します',
    gender: '男性',
    birth_date: '1996-01-01',
    address: '東京都'
    status: '転職活動中'
    detail: '特になし'
  )
profile1.save

profile2 = user2.build_profile(
  name: "プログラミンナ2",
  body: '初めましてよろしくお願い致します',
  gender: '男性',
  birth_date: '1996-01-01',
  address: '東京都'
  status: '転職活動中'
  detail: '特になし'
)
profile2.save

profile3 = user3.build_profile(
  name: "プログラミンナ3",
  body: '初めましてよろしくお願い致します',
  gender: '男性',
  birth_date: '1995-01-01',
  address: '東京都'
  status: '転職活動中'
  detail: '特になし'
)
profile3.save

profile4 = user4.build_profile(
  name: "プログラミン子4",
  body: '初めましてよろしくお願い致します',
  gender: '女性',
  birth_date: '2000-01-01',
  address: '東京都'
  status: '転職活動中'
  detail: '特になし'
)
profile4.save

profile5 = user5.build_profile(
  name: "プログラミン子5",
  body: '初めましてよろしくお願い致します',
  gender: '女性',
  birth_date: '2001-01-01',
  address: '東京都'
  status: '転職活動中'
  detail: '特になし'
)
profile5.save

portfolio1 = Portfolio.create!(
  portfolio_title: "テスト"
  portfolio_body: "テスト"
  portfolio_language: "テスト"
  portfolio_github: "テスト"
  portfolio_url: "テスト"
  user_id: "テスト"
  
)