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

# portfolios

portfolio1 = Portfolio.create!(
  portfolio_title: "テスト1"
  portfolio_body: "初めましてよろしくお願い致します。これはテストです"
  portfolio_language: " Java"
  portfolio_github: 'https://github.com/'
  portfolio_url: 'https://www.google.com/'
  user_id: user1.id
  
)
portfolio2 = Portfolio.create!(
  portfolio_title: "テスト2"
  portfolio_body: "初めましてよろしくお願い致します。これはテストです"
  portfolio_language: " JavaScript"
  portfolio_github: 'https://github.com/'
  portfolio_url: 'https://www.google.com/'
  user_id: user2.id
  
)
portfolio3 = Portfolio.create!(
  portfolio_title: "テスト3"
  portfolio_body: "初めましてよろしくお願い致します。これはテストです"
  portfolio_language: "Ruby"
  portfolio_github: 'https://github.com/'
  portfolio_url: 'https://www.google.com/'
  user_id: user3.id
  
)
portfolio4 = Portfolio.create!(
  portfolio_title: "テスト4"
  portfolio_body: "初めましてよろしくお願い致します。これはテストです"
  portfolio_language: "Kotlin"
  portfolio_github: 'https://github.com/'
  portfolio_url: 'https://www.google.com/'
  user_id: user4.id
  
)
portfolio5 = Portfolio.create!(
  portfolio_title: "テスト5"
  portfolio_body: "初めましてよろしくお願い致します。これはテストです"
  portfolio_language: "C++"
  portfolio_github: 'https://github.com/'
  portfolio_url: 'https://www.google.com/'
  user_id: user5.id
  
)

portfolio1.frameworks.create(
  framework_name: 'css'
  portfolio_id: portfolio1.id
)
portfolio1.frameworks.create(
  framework_name: 'html'
  portfolio_id: portfolio2.id
)
portfolio1.frameworks.create(
  framework_name: 'devise'
  portfolio_id: portfolio3.id
)
portfolio1.frameworks.create(
  framework_name: 'bootstrap'
  portfolio_id: portfolio4.id
)
portfolio1.frameworks.create(
  framework_name: 'jquery'
  portfolio_id: portfolio5.id
)

# favorite
Favorite.create!(
  user_id: user1.id,
  portfolio_id: portfolio1.id,
)

Favorite.create!(
  user_id: user2.id,
  portfolio_id: portfolio2.id,
)

Favorite.create!(
  user_id: user4.id,
  portfolio_id: portfolio2.id,
)

Favorite.create!(
  user_id: user5.id,
  portfolio_id: portfolio2.id,
)

Favorite.create!(
  user_id: user1.id,
  portfolio_id: portfolio4.id,
)


# conversation

conversation1 = conversation.create!(
  sender_id: user1.id,
  recipient_id: user2.id,
)

conversation2 = conversation.create!(
  sender_id: user3.id,
  recipient_id: user4.id,
)

conversation3 = conversation.create!(
  sender_id: user1.id,
  recipient_id: user3.id,
)

conversation4 = conversation.create!(
  sender_id: user2.id,
  recipient_id: user4.id,
)

conversation5 = conversation.create!(
  sender_id: user1.id,
  recipient_id: user5.id,
)

# message
Message.create!(
  message_body: "こんにちは",
  conversation_id: conversation1.id,
  user_id: user1.id,
  read: true,
)

Message.create!(
  message_body: "はじめまして！",
  conversation_id: conversation1.id,
  user_id: user2.id,
  read: false,
)

Message.create!(
  message_body: "ありがとうございました！",
  conversation_id: conversation2.id,
  user_id: user3.id,
  read: true,
)

Message.create!(
  message_body: "使いづらいですね",
  conversation_id: conversation2.id,
  user_id: user4.id,
  read: true,
)

Message.create!(
  message_body: "よろしくお願い致します",
  conversation_id: conversation2.id,
  user_id: user3.id,
  read: false,
)
