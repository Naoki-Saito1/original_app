FactoryBot.define do
  factory :user do
    email { 'testuser@mail.com' }
    password { 'test11' }
    admin { false }
  end

  factory :second_user, class: User do
    email { 'testuser2@mail.com' }
    password { 'test22' }
    admin { false }
  end

  factory :model_user, class: User do
    email { 'user@ex.com' }
    password { 'password' }
    admin { false }
  end
end
