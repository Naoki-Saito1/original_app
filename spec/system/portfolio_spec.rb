
require 'rails_helper'
now = Time.now
 RSpec.describe 'portfolio_system_spec', type: :system do
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
 

    @portfolio = Portfolio.create!(
      portfolio_title: "RspecTest1",
      portfolio_body: "初めましてよろしくお願い致します。",
      portfolio_language: "Java",
      portfolio_github: 'https://github.com/',
      portfolio_url: 'https://www.google.com/',
      created_at: now.prev_year,
      user_id: @user.id,
    )

    @portfolio2 = Portfolio.create!(
      portfolio_title: "RspecTest2",
      portfolio_body: "初めましてよろしくお願い致します。",
      portfolio_language: "Python",
      portfolio_github: 'https://github.com/',
      portfolio_url: 'https://www.google.com/',
      created_at: now.yesterday,
      user_id: @user.id,
    )

    @second_portfolio = Portfolio.create(
      portfolio_title: "RspecTest3",
      portfolio_body: "初めましてよろしくお願い致します。",
      portfolio_language: "Ruby",
      portfolio_github: 'https://github.com/',
      portfolio_url: 'https://www.google.com/',
      created_at: now,
      user_id: @second_user.id,
    )

    @portfolio.frameworks.create!(
      framework_name: 'css',
      portfolio_id: @portfolio.id,
    )
  end

  describe 'ポートフォリオCRUD機能のテスト' do
  
    context 'ポートフォリオ新規投稿,詳細' do
      it '投稿後詳細ページに遷移し投稿内容が含まれる' do
        visit user_session_path
        fill_in "メールアドレス", with: @user.email
        fill_in "パスワード", with: @user.password
        click_button "ログイン"
        visit new_portfolio_path
        fill_in "portfolio[portfolio_title]", with: "タイトルテスト１"
        fill_in "portfolio[portfolio_body]", with: "内容テスト"
        fill_in "portfolio[portfolio_url]", with: "https://programinna.herokuapp.com/"
        click_on "登録する"
        expect(page).to have_content 'タイトルテスト１'
        expect(page).to have_content '内容テスト'
      end
    end

    context 'ポートフォリオ編集' do
      it '内容を編集し編集内容が詳細ページに含まれる' do
        visit user_session_path
        fill_in "メールアドレス", with: @user.email
        fill_in "パスワード", with: @user.password
        click_button "ログイン"
        visit portfolio_path(@portfolio.id)
        click_on "編集"
        fill_in "portfolio[portfolio_title]", with: "タイトル編集テスト１"
        fill_in "portfolio[portfolio_body]", with: "内容編集テスト"
        fill_in "portfolio[portfolio_url]", with: "https://programinna.herokuapp.com/"
        click_on "更新する"
        expect(page).to have_content 'タイトル編集テスト１'
        expect(page).to have_content '内容編集テスト'
      end
    end

    context 'ポートフォリオ削除' do
      it 'ポートフォリオの削除し、' do
        visit user_session_path
        fill_in "メールアドレス", with: @user.email
        fill_in "パスワード", with: @user.password
        click_button "ログイン"
        visit portfolio_path(@portfolio.id)
        click_on "削除"
        accept_confirm
        expect(page).to have_content 'ポートフォリオ削除しました'
      end
    end

     context '自分以外のユーザーのポートフォリオ編集' do
        it '編集ボタンが表示されず編集できない' do
            visit user_session_path
            fill_in "メールアドレス", with: @user.email
            fill_in "パスワード", with: @user.password
            click_button "ログイン"
            visit portfolio_path(@second_portfolio.id)
            expect(page).not_to have_content '編集'
        end
     end
      context '自分以外のユーザーのポートフォリオ削除' do
        it '削除ボタンが表示されず編集できない' do
          visit user_session_path
          fill_in "メールアドレス", with: @user.email
          fill_in "パスワード", with: @user.password
          click_button "ログイン"
          visit portfolio_path(@second_portfolio.id)
          expect(page).not_to have_content '削除'
        end
      end
    end

    describe 'ポートフォリオの検索ソート' do

      context '言語による検索' do
        it '検索結果のみが表示される' do
          visit user_session_path
          fill_in "メールアドレス", with: @user.email
          fill_in "パスワード", with: @user.password
          click_button "ログイン"
          visit portfolios_path
          select  "Python", from: "q[portfolio_language_eq]"
          click_on "検索"
          expect(page).to have_content 'Python'
        end
      end

      context 'キーワード検索' do
        it '検索結果のみが表示される' do
          visit user_session_path
          fill_in "メールアドレス", with: @user.email
          fill_in "パスワード", with: @user.password
          click_button "ログイン"
          visit portfolios_path
          fill_in "q[frameworks_framework_name_cont]", with: "css"
          click_on "検索"
          expect(page).to have_content 'css'
        end
      end

      context '言語とキーワード検索' do
        it '検索結果のみが表示される' do
          visit user_session_path
          fill_in "メールアドレス", with: @user.email
          fill_in "パスワード", with: @user.password
          click_button "ログイン"
          visit portfolios_path
          select  "Python", from: "q[portfolio_language_eq]"
          fill_in "q[frameworks_framework_name_cont]", with: "css"
          click_on "検索"
          expect(page).to have_content 'Python'
          expect(page).to have_content 'css'
        end
      end

      context '新着順で並べ替え' do
        it '最新の投稿が表示される' do
          visit user_session_path
          fill_in "メールアドレス", with: @user.email
          fill_in "パスワード", with: @user.password
          click_button "ログイン"
          visit portfolios_path
          find(".sort_link").click
          expect(page).to have_content now.strftime("%Y-%m-%d")
        end
      end
     
    end
end
