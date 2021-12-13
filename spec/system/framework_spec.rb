require 'rails_helper'
now = Time.now
RSpec.describe 'framework_system_spec', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @profile = @user.build_profile(
      name: 'テスト太郎',
      body: '初めましてよろしくお願い致します',
      gender: '男性',
      birth_date: '1996-01-01',
      address: '東京都',
      status: '1ヶ月後転職活動予定',
      detail: '特になし'
    )
    @profile.save

    @second_user = FactoryBot.create(:second_user)
    @second_profile = @second_user.build_profile(
      name: 'テスト太郎2',
      body: '初めましてよろしくお願い致します',
      gender: '男性',
      birth_date: '1996-01-01',
      address: '東京都',
      status: '1ヶ月後転職活動予定',
      detail: '特になし'
    )
    @second_profile.save

    @portfolio = Portfolio.create!(
      portfolio_title: 'RspecTest1',
      portfolio_body: '初めましてよろしくお願い致します。',
      portfolio_language: 'Java',
      portfolio_github: 'https://github.com/',
      portfolio_url: 'https://www.google.com/',
      created_at: now.prev_year,
      user_id: @user.id
    )

    @portfolio2 = Portfolio.create!(
      portfolio_title: 'RspecTest2',
      portfolio_body: '初めましてよろしくお願い致します。',
      portfolio_language: 'Python',
      portfolio_github: 'https://github.com/',
      portfolio_url: 'https://www.google.com/',
      created_at: now.yesterday,
      user_id: @user.id
    )

    @second_portfolio = Portfolio.create(
      portfolio_title: 'RspecTest3',
      portfolio_body: '初めましてよろしくお願い致します。',
      portfolio_language: 'Ruby',
      portfolio_github: 'https://github.com/',
      portfolio_url: 'https://www.google.com/',
      created_at: now,
      user_id: @second_user.id
    )
  end
  describe 'フレームワークの投稿、編集、機能のテスト' do
    context 'ポートフォリオフレームワーク、新規投稿,詳細' do
      it '投稿後詳細ページに遷移し投稿内容が含まれる' do
        visit user_session_path
        fill_in 'メールアドレス', with: @user.email
        fill_in 'パスワード', with: @user.password
        click_button 'ログイン'
        visit new_portfolio_path
        fill_in 'portfolio[portfolio_title]', with: 'タイトルテスト１'
        fill_in 'portfolio[portfolio_body]', with: '内容テスト'
        fill_in 'portfolio[portfolio_url]', with: 'https://programinna.herokuapp.com/'
        fill_in 'portfolio[frameworks_attributes][0][framework_name]', with: 'rails'
        click_on '登録する'
        expect(page).to have_content 'rails'
      end
    end
  end
end
