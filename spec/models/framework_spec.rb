require 'rails_helper'

RSpec.describe Framework, type: :model do
  describe 'フレームワークバリデーションテスト' do
#  現在正規表現模索中のためコメントアウト

    # context '英数字の以外場合' do
    #   it 'バリデーション引っかかる' do
    #     user = FactoryBot.create(:model_user)
    #     user = user.build_profile(name: 'user')
    #     user.save
    #     portfolio = FactoryBot.create(:portfolio,portfolio_title:"テスト")
    #     framework =  portfolio.frameworks.build(framework_name:"こんにちは", portfolio_id: portfolio.id)
    #     expect(framework).not_to be_valid
    #   end
    # end

    context '英数字の場合' do
      it 'バリデーション通る' do
        user = FactoryBot.create(:model_user)
        user = user.build_profile(name: 'user')
        user.save
        portfolio = FactoryBot.create(:portfolio,portfolio_title:"テスト")
        framework =  portfolio.frameworks.build(framework_name:"rails", portfolio_id: portfolio.id)
        expect(framework).to be_valid
      end
    end
  end
end
