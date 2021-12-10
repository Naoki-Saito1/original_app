require 'rails_helper'
RSpec.describe 'プロフィール編集、更新', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @profile = @user.build_profile(
      name: "テスト太郎",
      body: '初めましてよろしくお願い致します',
      gender: '男性',
      birth_date: '1996-01-01',
      address: '東京都',
      status: '1ヶ月後転職活動予定',
      detail: '特になし',
    )
    @profile.save

    @second_user = FactoryBot.create(:second_user) 
    @second_profile = @second_user.build_profile(
      name: "テスト太郎2",
      body: '初めましてよろしくお願い致します',
      gender: '男性',
      birth_date: '1996-01-01',
      address: '東京都',
      status: '1ヶ月後転職活動予定',
      detail: '特になし',
    )
    @second_profile.save
  
  end
  describe 'プロフィール編集機能' do
    context 'ログイン後編集ボタンをクリックした場合' do
      it '編集画面に遷移し更新が出来る' do
        visit user_session_path
        fill_in "メールアドレス", with: @user.email
        fill_in "パスワード", with: @user.password
        click_button "ログイン"
        click_on "プロフィール編集"
        click_button "更新する"
        expect(page).to have_content "プロフィール更新しました"
      end
    end
  end
   
  
     context 'プロフィールのSNSの登録' do
       it '登録画面に遷移し登録が出来る' do
        visit user_session_path
        fill_in "メールアドレス", with: @user.email
        fill_in "パスワード", with: @user.password
        click_button "ログイン"
        click_on "SNS登録"
        click_button "登録する"
        expect(page).to have_content "登録しました"
       end
     end

     context 'プロフィールのSNSの更新' do
      it '更新画面に遷移し更新が出来る' do
       visit user_session_path
       fill_in "メールアドレス", with: @user.email
       fill_in "パスワード", with: @user.password
       click_button "ログイン"
       click_on "SNS登録"
       click_button "登録する"
       click_on "SNS編集"
       fill_in "link[twitter]", with: 'https://programinna.herokuapp.com/'
       click_button "更新する"
       expect(page).to have_content "更新しました"
      end
    end

    describe '他人のプロフィール編集' do
    context '他人のプロフィール画面に遷移した場合' do
      it '編集ボタンが表示されない' do
        visit user_session_path
        fill_in "メールアドレス", with: @user.email
        fill_in "パスワード", with: @user.password
        click_button "ログイン"
        visit profile_path(id: @second_profile.id )
        expect(page).not_to have_content "プロフィール編集"
      end
    end
  end

end