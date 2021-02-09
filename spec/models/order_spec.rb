require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Formオブジェクトを用いた購入情報の登録機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end

    it '必須項目を正しく入力したら登録できること' do
      expect(@order).to be_valid
    end
    it 'building_name:空でも登録できること' do
      @order.building_name = ""
      expect(@order).to be_valid
    end
    it 'postal_code:必須であること' do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("郵便番号を入力してください")
    end
    it 'postal_code:ハイフンが必須であること' do
      @order.postal_code = '12345678'
      @order.valid?
      expect(@order.errors.full_messages).to include('郵便番号を半角数字で入力してください')
    end
    it 'prefecture_id:必須であること' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("都道府県を入力してください")
    end
    it 'prefecture_id:はid:1以外を選択すること' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("都道府県は1以外の値にしてください")
    end
    it 'city:必須であること' do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("市区町村を入力してください")
    end
    it 'house_number:必須であること' do
      @order.house_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("番地を入力してください")
    end
    it 'phone_number:必須であること' do
      @order.phone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("電話番号を入力してください")
    end
    it 'phone_number:11桁以内の数値のみ保存可能なこと(１２桁)' do
      @order.phone_number = '0123456789012'
      @order.valid?
      expect(@order.errors.full_messages).to include('電話番号は11文字以内で入力してください')
    end
    it 'phone_number:11桁以内の数値のみ保存可能なこと(全角英大文字)' do
      @order.phone_number = 'ＡＢＣＤＥＦＧＨＩＪＫ'
      @order.valid?
      expect(@order.errors.full_messages).to include('電話番号を半角数字で入力してください')
    end
    it 'phone_number:11桁以内の数値のみ保存可能なこと(全角英小文字)' do
      @order.phone_number = 'ａｂｃｄｅｆｇｈｉｊｋ'
      @order.valid?
      expect(@order.errors.full_messages).to include('電話番号を半角数字で入力してください')
    end
    it 'item_id:必須であること' do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Itemを入力してください")
    end
    it 'user_id:必須であること' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Userを入力してください")
    end
    it 'token:必須であること' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
  end
end
