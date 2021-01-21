require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Formオブジェクトを用いた購入情報の登録機能' do
    before do
      @order = FactoryBot.build(:order)
    end

    context '配送先の情報登録のバリデーション'

    it '郵便番号の入力が必須であること' do
      @order.postal_code = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it '都道府県の入力が必須であること' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村の入力が必須であること' do
      @order.city = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it '番地の入力が必須であること' do
      @order.house_number = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号の入力が必須であること' do
      @order.phone_number = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it '郵便番号の保存にはハイフンが必要であること' do
      @order.postal_code = "12345678"
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid")
    end
    it 'phone_number:11桁以内の半角数値のみ保存可能なこと(１２桁)' do
      @order.phone_number = "0123456789012"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_number:11桁以内の半角数値のみ保存可能なこと(全角数値)' do
      @order.phone_number = "０１２３４５６７８９０１"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_number:11桁以内の半角数値のみ保存可能なこと(全角文字)' do
      @order.phone_number = "あいうえおかきくけこさ"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_number:11桁以内の半角数値のみ保存可能なこと(半角全角混合)' do
      @order.phone_number = "01234５６７８９０"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
    it '' do
      
    end
  end
end
