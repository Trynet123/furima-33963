require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    it 'ユーザーが紐づいていないと商品情報を保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it '必要な情報を入力すると商品情報が保存できること' do
      expect(@item.user).to be_valid
    end
    it "商品画像を1枚つけることが必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が必須であること' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態についての情報が必須であること' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it '配送料の負担についての情報が必須であること' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
    end
    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it '発送までの日数についての情報が必須であること' do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
    end
    it 'price：販売価格の入力が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'price：299以下では保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it 'price：10,000,000以上では保存できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it 'price：300以上で保存できる' do
      @item.price = 300
      expect(@item.user).to be_valid
    end
    it 'price：9,999,999以下で保存できる' do
      @item.price = 9999999
      expect(@item.user).to be_valid
    end
    it 'price：全角数字では保存できない' do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it 'price：全角文字では保存できない' do
      @item.price = "三百円"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
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
