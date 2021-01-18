require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー管理機能' do
    it 'nickname, email, password, password_confirmation, last_name, first_name, last_name_reading, first_name_reading, birth_dayがあれば登録できる' do
      expect(@user).to be_valid
    end
    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'aaaayahoo.co.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'password：半角英語のみは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'password：全角では登録できない' do
      @user.password = 'ぱすわあどで'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'password：全角英数混合は登録できない' do
      @user.password = 'Ik０１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password_confirmation = '00000b'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '姓：入力が必須であること' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it '名：入力が必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '姓：全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end
    it '名：全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'tester'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end
    it '姓（フリガナ）：入力が必須であること' do
      @user.last_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank")
    end
    it '名（フリガナ）：入力が必須であること' do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end
    it '姓（フリガナ）：全角（カタカナ）での入力が必須であること' do
      @user.last_name_reading = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name reading kana Full-width katakana characters')
    end
    it '名（フリガナ）：全角（カタカナ）での入力が必須であること' do
      @user.first_name_reading = 'testerr'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name reading kana Full-width katakana characters')
    end
    it '生年月日が必須であること' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
