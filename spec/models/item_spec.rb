require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    # 正常系テスト
    it '全て記入してあることで登録できること' do
      @item.name = 'プログラミングに関する本'
      @item.description = '吾輩は猫である'
      expect(@item).to be_valid
    end

    # 空欄、あるいは選択しなかった時の異常系テスト
    it '出品画像が空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が空では登録できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it '商品のカテゴリーが---では登録できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end
    it '商品の状態が---では登録できないこと' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Status is not a number')
    end
    it '配送料の負担が---では登録できないこと' do
      @item.burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Burden is not a number')
    end
    it '発送元の地域が---では登録できないこと' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture is not a number')
    end
    it '発送元までの日数が---では登録できないこと' do
      @item.date_of_shipment_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Date of shipment is not a number')
    end
    it '販売価格が空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    # 文字数制限による異常系テスト
    it '商品名が41文字以上では登録できないこと' do
      @item.valid?
      expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
    end
    it '商品の説明が1001文字以上では登録できないこと' do
      @item.valid?
      expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
    end
    it '販売価格が300円未満では登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it '販売価格が10000000円以上では登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    # 文字の種類制限による異常系テスト
    it '販売価格が漢字では登録できないこと' do
      @item.price = '五千'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it '販売価格が英字では登録できないこと' do
      @item.price = 'gosen'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it '販売価格が平仮名では登録できないこと' do
      @item.price = 'ごせん'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it '販売価格が片仮名では登録できないこと' do
      @item.price = 'ゴセン'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    # 数値制限による異常系テスト
    it 'カテゴリーに保存するidが1では登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品の状態に保存するidが1では登録できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end
    it '配送料の負担に保存するidが1では登録できないこと' do
      @item.burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Burden must be other than 1')
    end
    it '発送元の地域に保存するidが1では登録できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '発送までの日数に保存するidが1では登録できないこと' do
      @item.date_of_shipment_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Date of shipment must be other than 1')
    end
  end
end
