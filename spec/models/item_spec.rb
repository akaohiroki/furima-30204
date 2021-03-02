require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '全ての項目が入力がされていれば登録できる' do
        expect(@item).to be_valid
      end

      it '商品名が40字以内であれば登録できる' do
        @item.name = 'a' * 40
        expect(@item).to be_valid
      end

      it '商品の説明が1000字以内であれば登録できる' do
        @item.description = 'a' * 1000
        expect(@item).to be_valid
      end

      it '販売価格が半角数字であれば登録できる' do
        @item.price = 10_000
        expect(@item).to be_valid
      end

      it '販売価格が¥300以上であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end

      it '販売価格が¥9999999以下であれば登録できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品名が41文字以上では登録できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end

      it '商品の説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it '商品の説明が1001文字以上では登録できない' do
        @item.description = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end

      it '商品の詳細欄が未選択では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品の状態欄が未選択では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end

      it '配送料の負担欄が未選択では登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
      end

      it '発送元の地域欄が未選択では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '発送までの日数欄が未選択では登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
      end

      it '販売価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が半角数字のみでなければ登録できない' do
        @item.price = '¥10000en'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '販売価格が全角数字だと登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '販売価格が¥299以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格が¥10000000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '商品画像を添付していなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
