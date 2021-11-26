class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :portfolio_title, null: false
      t.text :portfolio_body, null: false
      t.text :portfolio_image
      t.integer :portfolio_language, null: false, default: 0
      t.string :portfolio_github
      t.text :portfolio_url, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
