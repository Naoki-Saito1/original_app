require 'application_system_test_case'

class PortfoliosTest < ApplicationSystemTestCase
  setup do
    @portfolio = portfolios(:one)
  end

  test 'visiting the index' do
    visit portfolios_url
    assert_selector 'h1', text: 'Portfolios'
  end

  test 'creating a Portfolio' do
    visit portfolios_url
    click_on 'New Portfolio'

    fill_in 'Portfolio body', with: @portfolio.portfolio_body
    fill_in 'Portfolio github', with: @portfolio.portfolio_github
    fill_in 'Portfolio image', with: @portfolio.portfolio_image
    fill_in 'Portfolio language', with: @portfolio.portfolio_language
    fill_in 'Portfolio title', with: @portfolio.portfolio_title
    fill_in 'Portfolio url', with: @portfolio.portfolio_url
    fill_in 'User', with: @portfolio.user_id
    click_on 'Create Portfolio'

    assert_text 'Portfolio was successfully created'
    click_on 'Back'
  end

  test 'updating a Portfolio' do
    visit portfolios_url
    click_on 'Edit', match: :first

    fill_in 'Portfolio body', with: @portfolio.portfolio_body
    fill_in 'Portfolio github', with: @portfolio.portfolio_github
    fill_in 'Portfolio image', with: @portfolio.portfolio_image
    fill_in 'Portfolio language', with: @portfolio.portfolio_language
    fill_in 'Portfolio title', with: @portfolio.portfolio_title
    fill_in 'Portfolio url', with: @portfolio.portfolio_url
    fill_in 'User', with: @portfolio.user_id
    click_on 'Update Portfolio'

    assert_text 'Portfolio was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Portfolio' do
    visit portfolios_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Portfolio was successfully destroyed'
  end
end
