FactoryBot.define do

  factory :user, class: User do
    id { 1 }
    email {"testuser@gmail.com"}
    password {"test11"}
    admin {false}
  end

  factory :second_user, class: User do
    id { 2 }
    email {"testuser2@gmail.com"}
    password {"test22"}
    admin {true}
  end
end
