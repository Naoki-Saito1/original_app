require 'rails_helper'
RSpec.describe 'conversation_system_spec', type: :system do
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

  describe 'メッセージ機能テスト' do
    context '自分以外のプロフィールページからメッセージ送信' do
      it 'ユーザー間のトークルームが作成される' do
        visit portfolio_path(@portfolio2.id)
        click_on 'メッセージを送る'
        expect(page).to have_content 'トークルーム作成されました'
      end
    end

    context 'メッセージ送信' do
      it '送信内容が画面に出力される' do
        visit portfolio_path(@portfolio2.id)
        click_on 'メッセージを送る'
        fill_in 'message[message_body]', with: 'こんにちは'
        click_button 'メッセージ送信'
        sleep 1.0
        expect(page).to have_content 'こんにちは'
      end
    end

    context 'プロフィールが自分の場合' do
      it 'メッセージボタンが表示されない' do
        visit profile_path(@profile.id)
        expect(page).not_to have_button 'メッセージ送信'
      end
    end
  end
end
