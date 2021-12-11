require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  describe 'ポートフォリオバリデーションのテスト' do
  
    context 'タイトルが空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.create(:model_user)
        user = user.build_profile(name: 'user')
        user.save
        portfolio = FactoryBot.build(:portfolio,portfolio_title:"")
        expect(portfolio).not_to be_valid
      end
    end

    context '内容が空の場合' do
       it 'バリデーションに引っかかる' do
          user = FactoryBot.create(:model_user)
          user = user.build_profile(name: 'user')
          user.save
          portfolio = FactoryBot.build(:portfolio, portfolio_body:"")
          expect(portfolio).not_to be_valid
      end
    end

    context 'URLが空の場合' do
      it 'バリデーションに引っかかる' do
         user = FactoryBot.create(:model_user)
         user = user.build_profile(name: 'user')
         user.save
         portfolio = FactoryBot.build(:portfolio, portfolio_url:"")
         expect(portfolio).not_to be_valid
     end
   end

    context 'タイトルが40字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.create(:model_user)
        user = user.build_profile(name: 'user')
        user.save
        portfolio = FactoryBot.build(:portfolio,portfolio_title: "あ" * 41 )
        expect(portfolio).not_to be_valid
      end
    end

      context '内容が空の場合' do
        it 'バリデーションに引っかかる' do
          user = FactoryBot.create(:model_user)
          user = user.build_profile(name: 'user')
          user.save
          portfolio = FactoryBot.build(:portfolio, portfolio_body: "あ" * 1001 )
          expect(portfolio).not_to be_valid
      end
    end

      context 'URLのフォーマットが正しくない場合' do
        it 'バリデーションに引っかかる' do
          user = FactoryBot.create(:model_user)
          user = user.build_profile(name: 'user')
          user.save
          portfolio = FactoryBot.build(:portfolio, portfolio_url: "abckefghijk")
          expect(portfolio).not_to be_valid
        end
      end

      context 'githubのフォーマットが正しくない場合' do
        it 'バリデーションに引っかかる' do
          user = FactoryBot.create(:model_user)
          user = user.build_profile(name: 'user')
          user.save
          portfolio = FactoryBot.build(:portfolio, portfolio_github: "abckefghijk")
          expect(portfolio).not_to be_valid
        end
      end
    end
    describe 'ポートフォリオバリデーションのテスト合格パターン' do

      context 'タイトルが正しい' do
        it 'バリデーション通過' do
          user = FactoryBot.create(:model_user)
          user = user.build_profile(name: 'user')
          user.save
          portfolio = FactoryBot.build(:portfolio,portfolio_title:"テスト")
          expect(portfolio).to be_valid
        end
      end

      context '内容が正しい場合' do
          it 'バリデーション通過' do
            user = FactoryBot.create(:model_user)
            user = user.build_profile(name: 'user')
            user.save
            portfolio = FactoryBot.build(:portfolio, portfolio_body:"こんにちは")
            expect(portfolio).to be_valid
        end
      end

      context 'URLのフォーマットが正しい場合' do
        it 'バリデーション通過' do
            user = FactoryBot.create(:model_user)
            user = user.build_profile(name: 'user')
            user.save
            portfolio = FactoryBot.build(:portfolio, portfolio_url:"http://localhost:3000/")
            expect(portfolio).to be_valid
        end
      end
    end
  end




