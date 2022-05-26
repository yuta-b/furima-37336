require 'rails_helper'

RSpec.describe Item, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/flag.png')
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

      it "category_idが空では登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category can't be blank")
      end

      it "condition_idが空では登録できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition can't be blank")
      end

      it "delivery_charge_idが空では登録できない" do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank", "Delivery charge can't be blank")
      end

      it "delivery_place_idが空では登録できない" do
        @item.delivery_place_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery place can't be blank", "Delivery place can't be blank")
      end

      it "delivery_days_idが空では登録できない" do
        @item.delivery_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't be blank", "Delivery days can't be blank")
      end

      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

    end
  end
end
