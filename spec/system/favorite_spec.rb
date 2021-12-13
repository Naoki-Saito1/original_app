require 'rails_helper'
RSpec.describe 'favorite_system_spec', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @profile = @user.build_profile(
      name: 'テスト太郎'
    )
    @profile.save

    @second_user = FactoryBot.create(:second_user)
    @second_profile = @second_user.build_profile(
      name: 'テスト太郎2'
    )
    @second_profile.save

    @portfolio = Portfolio.create!(
      portfolio_title: 'RspecTest1',
      portfolio_body: '初めましてよろしくお願い致します。',
      portfolio_url: 'https://www.google.com/',
      user_id: @user.id
    )

    @portfolio2 = Portfolio.create!(
      portfolio_title: 'RspecTest2',
      portfolio_body: '初めましてよろしくお願い致します。',
      portfolio_url: 'https://www.google.com/',
      user_id: @second_user.id
    )
    visit user_session_path
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'
  end

  describe 'お気に入り機能テスト' do
    context 'お気に入り登録', js: true, retry: 3 do
      it 'いいねクリックでお気に入りが出来る' do
        visit portfolio_path(@portfolio2.id)
        find("#likes_buttons#{@portfolio2.id}").click
        expect(page).to have_content 'いいね 0'
      end
    end

    context 'お気に入り解除' do
      it '解除クリックで解除される' do
        visit portfolio_path(@portfolio2.id)
        find("#likes_buttons#{@portfolio2.id}").click
        find("#likes_buttons#{@portfolio2.id}").click
        expect(page).to have_content '0'
      end
    end

    context '自分の投稿の場合' do
      it 'いいねが表示されない(削除ボタンが表示される)' do
        visit portfolio_path(@portfolio.id)
        expect(page).to have_content '削除'
      end
    end
  end
end
