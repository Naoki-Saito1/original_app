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

# admin

admin = User.create!(
  email: "test_admin1@test.com",
  password:  "a123456",
  admin: true
)
admin1 = User.create!(
  email: "test_admin2@test.com",
  password:  "b123456",
  admin: true
)

# user
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
# ok
profile = admin.build_profile(
  
  body: '初めましてよろしくお願い致します',
  gender: '男性',
  birth_date: '1996-01-01',
  address: '東京都',
  status: '現在転職活動中',
  detail: '特になし',
)
profile.save

profile1 = user1.build_profile(
    name: "プログラミンナ1",
    body: '初めましてよろしくお願い致します',
    gender: '男性',
    birth_date: '1996-01-01',
    address: '東京都',
    status: '1ヶ月後転職活動予定',
    detail: '特になし',
  )
profile1.save

profile2 = user2.build_profile(
  name: "プログラミンナ2",
  body: '初めましてよろしくお願い致します',
  gender: '男性',
  birth_date: '1996-01-01',
  address: '東京都',
  status: '3ヶ月後転職活動予定',
  detail: '特になし',
)
profile2.save

profile3 = user3.build_profile(
  name: "プログラミンナ3",
  body: '初めましてよろしくお願い致します',
  gender: '男性',
  birth_date: '1995-01-01',
  address: '東京都',
  status: '1ヶ月後転職活動予定',
  detail: '特になし',
)
profile3.save

profile4 = user4.build_profile(
  name: "プログラミン子4",
  body: '初めましてよろしくお願い致します',
  gender: '女性',
  birth_date: '2000-01-01',
  address: '東京都',
  status: '3ヶ月後転職活動予定',
  detail: '特になし',
)
profile4.save

profile5 = user5.build_profile(
  name: "プログラミン子5",
  body: '初めましてよろしくお願い致します',
  gender: '女性',
  birth_date: '2001-01-01',
  address: '東京都',
  status: '3ヶ月後転職活動予定',
  detail: '特になし',
)
profile5.save

# portfolios

portfolio1 = Portfolio.create!(
  portfolio_title: "テスト1",
  portfolio_body: "初めましてよろしくお願い致します。これはseedです",
  portfolio_language: "Java",
  portfolio_github: 'https://github.com/',
  portfolio_url: 'https://www.google.com/',
  user_id: user1.id,
  
)
portfolio2 = Portfolio.create!(
  portfolio_title: "テスト2",
  portfolio_body: "初めましてよろしくお願い致します。これはseedです",
  portfolio_language: "JavaScript",
  portfolio_github: 'https://github.com/',
  portfolio_url: 'https://www.google.com/',
  user_id: user2.id,
  
)
portfolio3 = Portfolio.create!(
  portfolio_title: "テスト3",
  portfolio_body: "初めましてよろしくお願い致します。これはseedです",
  portfolio_language: "Ruby",
  portfolio_github: 'https://github.com/',
  portfolio_url: 'https://www.google.com/',
  user_id: user3.id,
  
)
portfolio4 = Portfolio.create!(
  portfolio_title: "テスト4",
  portfolio_body: "初めましてよろしくお願い致します。これはseedです",
  portfolio_language: "Kotlin",
  portfolio_github: 'https://github.com/',
  portfolio_url: 'https://www.google.com/',
  user_id: user4.id,
  
)
portfolio5 = Portfolio.create!(
  portfolio_title: "テスト5",
  portfolio_body: "初めましてよろしくお願い致します。これはseedです",
  portfolio_language: "C++",
  portfolio_github: 'https://github.com/',
  portfolio_url: 'https://www.google.com/',
  user_id: user5.id,
  
)

portfolio1.frameworks.create!(
  framework_name: 'css',
  portfolio_id: portfolio1.id,
)
portfolio2.frameworks.create!(
  framework_name: 'html',
  portfolio_id: portfolio2.id,
)
portfolio3.frameworks.create!(
  framework_name: 'devise',
  portfolio_id: portfolio3.id,
)
portfolio4.frameworks.create!(
  framework_name: 'bootstrap',
  portfolio_id: portfolio4.id,
)
portfolio5.frameworks.create!(
  framework_name: 'jquery',
  portfolio_id: portfolio5.id,
)

# favoriteok(自分が投稿したやつはお気に入りできない)
Favorite.create!(
  user_id: user1.id,
  portfolio_id: portfolio5.id,
)

Favorite.create!(
  user_id: user2.id,
  portfolio_id: portfolio4.id,
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


# conversationok

conversation1 = Conversation.create!(
  sender_id: user1.id,
  recipient_id: user2.id,
)

conversation2 = Conversation.create!(
  sender_id: user3.id,
  recipient_id: user4.id,
)

conversation3 = Conversation.create!(
  sender_id: user1.id,
  recipient_id: user3.id,
)

conversation4 = Conversation.create!(
  sender_id: user2.id,
  recipient_id: user4.id,
)

conversation5 = Conversation.create!(
  sender_id: user1.id,
  recipient_id: user5.id,
)

# messageok
Message.create!(
  message_body: "こんにちは",
  conversation_id: conversation1.id,
  user_id: user1.id,
  message_read: true,
)

Message.create!(
  message_body: "はじめまして！",
  conversation_id: conversation1.id,
  user_id: user2.id,
  message_read: false,
)

Message.create!(
  message_body: "ありがとうございました！",
  conversation_id: conversation2.id,
  user_id: user3.id,
  message_read: true,
)

Message.create!(
  message_body: "今の気持ちは喜です",
  conversation_id: conversation2.id,
  user_id: user4.id,
  message_read: true,
)

Message.create!(
  message_body: "よろしくお願い致します",
  conversation_id: conversation2.id,
  user_id: user3.id,
  message_read: false,
)
