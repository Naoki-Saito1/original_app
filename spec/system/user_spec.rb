require 'rails_helper'

RSpec.describe 'ユーザー登録テスト', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

 
  describe 'ユーザー新規登録テスト' do
    

    context 'ユーザーを新規登録' do
      it '新規登録した場合、マイページに遷移' do
        visit new_user_registration_path
        fill_in "名前", with:'テスト太郎'
        fill_in "メールアドレス", with:'sample@gmail.com'
        fill_in "パスワード", with:'1111111'
        fill_in "パスワード（確認用）", with:'1111111'                
        click_on "新規作成"
        expect(page).to have_content 'マイページ'
      end
    end
 
 
    context 'ユーザーがログインした場合' do
      it 'ログイン成功した場合マイページに遷移し名前が表示される' do
        visit user_session_path
        fill_in "メールアドレス", with: @user.email
        fill_in "パスワード", with: @user.password
        click_button "ログイン"
        expect(page).to have_content 'ログインしました'
      end
    end

    context 'ユーザーログインせずにポートフォリオ一覧画面にアクセスしようとした場合' do
      it 'ログイン画面に遷移する' do
        visit portfolios_path
        expect(page).to have_content 'ログインもしくはアカウント登録してください。'
      end
    end
  
  end
end