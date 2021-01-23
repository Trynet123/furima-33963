require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Formオブジェクトを用いた購入情報の登録機能' do
    before do
      @order = FactoryBot.build(:order)
    end

    it 'postal_code:必須であること' do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_code:ハイフンが必須であること' do
      @order.postal_code = '12345678'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code is invalid')
    end
    it 'prefecture_id:必須であること' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'city:必須であること' do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it 'house_number:必須であること' do
      @order.house_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_number:必須であること' do
      @order.phone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_number:11桁以内の数値のみ保存可能なこと(１２桁)' do
      @order.phone_number = '0123456789012'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
    it 'phone_number:11桁以内の数値のみ保存可能なこと(全角英大文字)' do
      @order.phone_number = 'ＡＢＣＤＥＦＧＨＩＪＫ'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_number:11桁以内の数値のみ保存可能なこと(全角英小文字)' do
      @order.phone_number = 'ａｂｃｄｅｆｇｈｉｊｋ'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid')
    end
    it 'item_id:必須であること' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
    it 'user_id:必須であること' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it 'token:必須であること' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
