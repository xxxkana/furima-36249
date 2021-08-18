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
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end

    it "nameが空だと登録できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it "commentsが空だと登録できない" do
      @item.comments = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("コメントを入力してください")
    end

    it "category_idが選択されてないと登録できない" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
    end

    it "condition_idが選択されてないと登録できない" do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を選択してください")
    end

    it "delivery_fee_idが選択されてないと登録できない" do
      @item.delivery_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料を選択してください")
    end

    it "prefecture_idが選択されてないと登録できない" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
    end

    it "shipment_day_idが選択されてないと登録できない" do
      @item.shipment_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
    end

    it 'カテゴリーのアクティブハッシュのカラムが１では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
    end

    it '商品の状態のアクティブハッシュのカラムが１では登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を選択してください")
    end

    it '配送料の負担のアクティブハッシュのカラムが１では登録できない' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料を選択してください")
    end

    it '発送元の地域のアクティブハッシュのカラムが１では登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
    end

    it '発送までの日時のアクティブハッシュのカラムが１では登録できない' do
      @item.shipment_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
    end



    it "priceが空だと登録できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("値段を入力してください")
    end

    it "priceを全角文字で入力すると登録できない" do
      @item.price ='１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("値段は数値で入力してください")
    end

    it "priceを半角英数字混合で入力すると登録できない" do
      @item.price ='1400a'
      @item.valid?
      expect(@item.errors.full_messages).to include("値段は数値で入力してください")
    end

    it "priceを半角英語で入力すると登録できない" do
      @item.price ='aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("値段は数値で入力してください")
    end

    it "priceを299円以下に設定すると登録できない" do
      @item.price = 150
      @item.valid?
      expect(@item.errors.full_messages).to include("値段は299より大きい値にしてください")
    end

    it "priceを10,000,000円以上に設定すると登録できない" do
      @item.price = 10567000
      @item.valid?
      expect(@item.errors.full_messages).to include("値段は10000000より小さい値にしてください")
    end


    it 'ユーザーと紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Userを入力してください")
    end
   end 
  end
    



end
