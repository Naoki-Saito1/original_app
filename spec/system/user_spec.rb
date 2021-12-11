require 'rails_helper'

 RSpec.describe 'ユーザーsystem', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @user1 = @user.build_profile(
    name: "user_test",)
    @user.save
  end

  describe 'ユーザー登録,ログイン,ログアウト' do
  
    context 'ユーザーを新規登録' do
      it 'ログイン後マイページに遷移' do
        visit new_user_registration_path
        fill_in "名前", with:'テスト太郎'
        fill_in "メールアドレス", with:'sample@gmail.com'
        fill_in "パスワード", with:'1111111'
        fill_in "パスワード（確認用）", with:'1111111'                
        click_on "新規作成"
        expect(page).to have_content 'マイページ'
      end
    end
 
 
    context 'ユーザーログイン' do
      it 'ログイン後マイページに遷移' do
        visit user_session_path
        fill_in "メールアドレス", with: @user.email
        fill_in "パスワード", with: @user.password
        click_button "ログイン"
        expect(page).to have_content 'ログインしました'
      end
    end

    context 'ログアウトボタンクリック' do
      it 'ログアウトしTOPページに遷移' do
        visit user_session_path
        fill_in "メールアドレス", with: @user.email
        fill_in "パスワード", with: @user.password
        click_button "ログイン"
        find(".navbar-toggler").click
        click_on "ログアウト"
        expect(page).to have_content 'ゲストはこちら'
      end
    end
  end

  describe 'ログインアクセス制限テスト' do
    context 'ログインせずにポートフォリオ一覧画面にアクセス' do
      it 'ログイン画面に遷移する' do
        visit portfolios_path
        expect(page).to have_content 'ログインもしくはアカウント登録してください。'
      end
    end
  
    context 'ログインせずにユーザー一覧画面にアクセス' do
      it 'ログイン画面に遷移する' do
        visit profiles_path
        expect(page).to have_content 'ログインもしくはアカウント登録してください。'
      end
    end
    context 'ログインせずにメッセージ一覧画面にアクセス' do
      it 'ログイン画面に遷移する' do
        visit profiles_path
        expect(page).to have_content 'ログインもしくはアカウント登録してください。'
      end
    end
  end
end