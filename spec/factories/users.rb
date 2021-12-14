FactoryBot.define do
  factory :user do
    # sequence(:email) { |n| "tama#{n}@cat.com" }
    email { 'TestUser@mail.com' }
    password { 'test11' }
    admin { false }
  end

  factory :second_user, class: User do
    # sequence(:email) { |n| "tama#{n}@cat.com" }
    email { 'TestUser2@mail.com' }
    password { 'test22' }
    admin { false }
  end

  factory :model_user, class: User do
    email { 'user@ex.com' }
    password { 'password' }
    admin { false }
  end
end
