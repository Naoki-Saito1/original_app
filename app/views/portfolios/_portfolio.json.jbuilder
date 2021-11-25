json.extract! portfolio, :id, :portfolio_title, :portfolio_body, :portfolio_image, :portfolio_language, :portfolio_github, :portfolio_url, :user_id, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)
