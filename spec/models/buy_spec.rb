require 'rails_helper'

RSpec.describe ItemBuy, type: :model do
  describe '#create' do
    before do
      @buy = FactoryBot.build(:item_buy)
    end

    # 正常系テスト
    it '全て記入してあることで登録できること' do
      expect(@buy).to be_valid
    end
    it '建物名を記述しなくても登録できること' do
      @buy.building_name = ""
      expect(@buy).to be_valid
    end

    # 空欄、あるいは選択しなかった時の異常系テスト
    it '郵便番号が空では登録できないこと' do
      @buy.postal_code = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal code can't be blank")
    end
    it '発送元の地域が空では登録できないこと' do
      @buy.prefecture_id = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送元の地域に保存するidが1では登録できないこと' do
      @buy.prefecture_id = 1
      @buy.valid?
      expect(@buy.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '市区町村が空では登録できないこと' do
      @buy.municipality = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が空では登録できないこと' do
      @buy.house_number = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号が空では登録できないこと' do
      @buy.phone_number = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'トークンが空では登録できないこと' do
      @buy.token = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号にハイフンがなければ登録できないこと' do
      @buy.postal_code = "0001111"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal code is invalid")
    end
    it '電話番号にハイフンがあると登録できないこと' do
      @buy.phone_number = "090-1234-5678"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が12桁以上だと登録できないこと' do
      @buy.phone_number = "090123456789"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
