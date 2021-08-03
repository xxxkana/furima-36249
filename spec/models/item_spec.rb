require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end  
  describe "新規出品登録" do
   context "新規出品がうまくいく時" do
   it "全て入力値が正しい場合登録ができる" do
    expect(@item).to be_valid
    end
   end 

   context "新規出品がうまくいかない時" do
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空だと登録できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "category_idが選択されてないと登録できない" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "condition_idが選択されてないと登録できない" do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it "delivery_fee_idが選択されてないと登録できない" do
      @item.delivery_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it "prefecture_idが選択されてないと登録できない" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "shipment_day_idが選択されてないと登録できない" do
      @item.shipment_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment day can't be blank")
    end

    it 'カテゴリーのアクティブハッシュのカラムが１では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態のアクティブハッシュのカラムが１では登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it '配送料の負担のアクティブハッシュのカラムが１では登録できない' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it '発送元の地域のアクティブハッシュのカラムが１では登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日時のアクティブハッシュのカラムが１では登録できない' do
      @item.shipment_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment day can't be blank")
    end



    it "priceが空だと登録できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceを全角文字で入力すると登録できない" do
      @item.price ='１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "priceを半角英数字混合で入力すると登録できない" do
      @item.price ='1400a'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "priceを半角英語で入力すると登録できない" do
      @item.price ='aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    
    it 'ユーザーと紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
   end 
  end
    



end
