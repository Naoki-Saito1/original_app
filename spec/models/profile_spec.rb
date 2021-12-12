require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'プロフィールバリデーションのテスト' do
    
    context '内容入力欄が1000文字以上の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new( email:'user@ex.com', password:'password')
        user = user.build_profile(name: 'user',body: 'a'*1001)
        user.save
        expect(user).not_to be_valid
      end
    end
    context '同じユーザーがプロフィールを２つ作成' do
      it 'バリデーションにひっかかる' do
        user = User.new(email:'user@ex.com', password:'password', id: 1000)
        user = user.build_profile(name: 'user')
        user.save 
        user = User.new(email:'user2@ex.com', password:'password2',id: 1000)
        user = user.build_profile(name: 'user')
        user.save 
        expect(user).not_to be_valid
      end
    end
    context '就職活動詳細が250文字以上の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new( email:'user@ex.com', password:'password')
        user = user.build_profile(name: 'user',detail: 'a'*251)
        user.save
        expect(user).not_to be_valid
      end
    end
  end
end

