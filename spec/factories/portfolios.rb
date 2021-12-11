now = Time.now
FactoryBot.define do
  # @user = FactoryBot.create(:user)
  # @second_user = FactoryBot.create(:second_user) 
  factory :portfolio do
    portfolio_title {"RspecTest1"} 
    portfolio_body {"初めましてよろしくお願い致します。"}
    portfolio_language {"Java"}
    portfolio_github {'https://github.com/'}
    portfolio_url {'https://www.google.com/'}
    created_at {now.prev_year}
    # user_id {user.id}
  end

  factory :portfolio2, class: Portfolio do
    portfolio_title {"RspecTest2"}
    portfolio_body {"初めましてよろしくお願い致します。"}
    portfolio_language {"Python"}
    portfolio_github {'https://github.com/'}
    portfolio_url {'https://www.google.com/'}
    created_at {now.yesterday}
    # user_id {user.id}
  end

  factory :second_portfolio, class: Portfolio do
    portfolio_title {"RspecTest3"}
    portfolio_body {"初めましてよろしくお願い致します。"}
    portfolio_language {"Ruby"}
    portfolio_github {'https://github.com/'}
    portfolio_url {'https://www.google.com/'}
    created_at {now}
    # user_id {second_user.id}
    
  end
end


