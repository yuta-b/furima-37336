require 'rails_helper'

RSpec.describe Item, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it "全ての商品出品の全項目が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品できない場合' do
      it "prodect_nameが空では登録できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it "product_versionが空では登録できない" do
        @item.product_version = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product version can't be blank")
      end

      it "category_idが「---」では登録できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category に「---」は選択不可")
      end

      it "condition_idが「---」では登録できない" do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition に「---」は選択不可")
      end

      it "delivery_charge_idが「---」では登録できない" do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge に「---」は選択不可")
      end

      it "delivery_place_idが「---」では登録できない" do
        @item.delivery_place_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery place に「---」は選択不可")
      end

      it "delivery_days_idが「---」では登録できない" do
        @item.delivery_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days に「---」は選択不可")
      end

      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが¥300~¥9,999,999の間でないと登録できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字で300〜9,999,999の範囲で入力してください")
      end

      it "priceが¥300~¥9,999,999の間でないと登録できない" do
        @item.price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字で300〜9,999,999の範囲で入力してください")
      end

      it "priceは大文字では登録できない" do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字で300〜9,999,999の範囲で入力してください")
      end

      it "userが紐づいていない場合は登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
