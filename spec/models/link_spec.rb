require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'リンクバリデーションのテスト' do
    context 'フォーマットが正しくない場合' do
      it 'バリデーション引っかかる' do
        user = FactoryBot.create(:model_user)
        profile = user.build_profile(name: 'user')
        profile.save
        link = Link.new(twitter: 'abcdefg', profile_id: profile.id)
        expect(link).not_to be_valid
      end
    end
    context 'フォーマットが正しい場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:model_user)
        profile = user.build_profile(name: 'user')
        profile.save
        link = Link.new(twitter: 'https://twitter.com/', profile_id: profile.id)
        expect(link).to be_valid
      end
    end
  end
end
