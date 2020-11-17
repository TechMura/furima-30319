require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      image_path = Rails.root.join('public/images/test.jpeg')
      @item.image = fixture_file_upload(image_path)
    end
    context '新規登録がうまくいくとき' do
      it 'image,name,explanation,category_id,status,delivery_payment_id,prefecture_id,shipping_period_id,priceがすべてあれば登録できること' do
        expect(@item).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'imageが空なら登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'nameが空なら登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'nameが40文字を超えた場合登録できないこと' do
        @item.name = Faker::Base.regexify('[123nameなまえナマエ名前]{41}')
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名は40文字以内で入力してください")
      end
      it 'explanationが空だと登録でないこと' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'explanationが空だと登録できないこと' do
        @item.explanation = Faker::Base.regexify('[123explanationせつめいセツメイ説明]{1001}')
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明は1000文字以内で入力してください")
      end
      it 'category_idが空なら登録できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'status_idが空なら登録できないこと' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'delivery_payment_idが空なら登録できないこと' do
        @item.delivery_payment_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送量の負担を入力してください")
      end
      it 'prefecture_idが空なら登録できないこと' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'shipping_period_idが空なら登録できないこと' do
        @item.shipping_period_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'priceが空なら登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'priceに文字が入っていたら登録できないこと' do
        @item.price = 'きんがく'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'priceに全角数字が入っていたら登録できないこと' do
        @item.price = '３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'priceに300より小さい金額が入っていたら登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it 'priceに9,999,999より大きい金額が入っていたら登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
    end
  end
end
