require 'rails_helper'

RSpec.describe AddressUserItem, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @address_user_item= FactoryBot.build(:address_user_item, item_id: item.id, user_id: user.id)
    sleep 0.1
  end

  describe "新規購入" do
    context '新規購入ができる時' do
      it "phone_numberが11桁の時購入ができる" do
        @address_user_item.phone_number = 12345678956
        expect(@address_user_item).to be_valid
        end

      it "全て入力値が正しい場合購入ができる" do
        expect(@address_user_item).to be_valid
        end

      it "建物名が空の場合でも購入できること" do
        @address_user_item.building_number = ''
        expect(@address_user_item).to be_valid
        end

    end
  

    context '新規投稿できない時' do
      it "tokenが空では購入できない" do
        @address_user_item.token = nil
        @address_user_item.valid?
        expect(@address_user_item.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空では保存ができないこと" do
        @address_user_item.postal_code = ''
        @address_user_item.valid?
        expect(@address_user_item.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeは「3桁ハイフン4桁」の半角文字列のみでないと購入できない" do
        @address_user_item.postal_code ='1234567'
        @address_user_item.valid?
        expect(@address_user_item.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end  

      it "postal_codeに全角文字列を使うと購入できない" do
        @address_user_item.postal_code ='１２３-４５６７'
        @address_user_item.valid?
        expect(@address_user_item.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end  

      it "prefecture_idが選択されてないと購入できない" do
        @address_user_item.prefecture_id = nil
        @address_user_item.valid?
        expect(@address_user_item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idのアクティブハッシュのカラムが0では登録できない' do
        @address_user_item.prefecture_id = 0
        @address_user_item.valid?
        expect(@address_user_item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空だと購入できない" do
        @address_user_item.city = ''
        @address_user_item.valid?
        expect(@address_user_item.errors.full_messages).to include("City can't be blank")
      end

      it "house_numberが空だと購入できない" do
        @address_user_item.house_number = ''
        @address_user_item.valid?
        expect(@address_user_item.errors.full_messages).to include("House number can't be blank")
      end

      it "phone_numberが空だと購入できない" do
        @address_user_item.phone_number = ''
        @address_user_item.valid?
        expect(@address_user_item.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberは10桁または11桁でないと購入できない" do
        @address_user_item.phone_number = '12345'
        @address_user_item.valid?
        expect(@address_user_item.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが12桁以上の時購入できない" do
        @address_user_item.phone_number = '01234567890234'
        @address_user_item.valid?
        expect(@address_user_item.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが英数混同の時購入できない" do
        @address_user_item.phone_number = '01abg567890234'
        @address_user_item.valid?
        expect(@address_user_item.errors.full_messages).to include("Phone number is invalid")
      end

      it "user_idが空では購入できない" do
        @address_user_item.user_id = nil
        @address_user_item.valid?
        expect(@address_user_item.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では購入できない" do
        @address_user_item.item_id = nil
        @address_user_item.valid?
        expect(@address_user_item.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
