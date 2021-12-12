require 'rails_helper'

RSpec.describe User, type: :model do  

  describe 'バリデーションのテスト' do
    context '名前が未入力の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(email:'user@ex.com', password:'password')
        user = user.build_profile(name: "")
       
        expect(user).not_to be_valid
      end
    end
  
    context '名前が25文字以上のみの場合' do
      it 'バリデーションにひっかかる' do
        user = User.new( email:'user@ex.com', password:'password')
        user = user.build_profile(name: 'over twenty-five letter name')
        
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが未入力の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(email:'', password:'password')
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが形式と違う場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(email:'user.com', password:'password')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが未入力の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(email:'user@ex.com', password:'')
        expect(user).not_to be_valid
      end  
    end
    context 'パスワードが6文字未満の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(email:'user@ex.com', password:'word')
        expect(user).not_to be_valid
      end  
    end
    context '名前、メールアドレス、パスワードが入力されてる場合' do
      it 'バリデーションが通る' do
        user = User.new(email:'user@ex.com', password:'password')
        user = user.build_profile(name: 'user')
        expect(user).to be_valid
      end
    end
  end
end