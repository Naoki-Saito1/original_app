require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  describe 'プロフィール編集機能' do
    context 'ログイン後編集ボタンをクリックした場合' do
      it '編集画面に遷移し更新が出来る' do
        visit user_session_path
        fill_in "メールアドレス", with: @user.email
        fill_in "パスワード", with: @user.password
        click_button "ログイン"
        click_button "プロフィール編集"
        click_button "更新する"
        expect(page).to have_content 'プロフィールを更新しました'
      end
    end
  end
  
  # describe '詳細表示機能' do
  #    context '任意のタスク詳細画面に遷移した場合' do
  #      it '該当タスクの内容が表示される' do
  #      end
  #    end
  # end
end