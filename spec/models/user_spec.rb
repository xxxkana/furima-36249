require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end  

  describe "ユーザー新規登録" do
   context "新規登録がうまくいく時" 
     it "苗字は全角の時登録出来る" do
       @user.family_name = "山田"
       expect(@user).to be_valid
    end

    it "名前は全角の時登録出来る" do
      @user.family_name = "花子"
      expect(@user).to be_valid
   end

    it "苗字の読み仮名は全角(カタカナ)の時登録出来る" do
      @user.family_name = "ヤマダ"
      expect(@user).to be_valid
   end

    it "名前の読み仮名は全角(カタカナ)の時登録出来る" do
      @user.family_name = "ハナコ"
      expect(@user).to be_valid
   end

   end

   
   context "新規登録がうまくいかない時" do
    it "emailが空だと登録できない" do
      @user.email =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end  

    it "nicknameが空だと登録できない" do
      @user.nickname =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end  
    
    it "family_nameが空だと登録できない" do
      @user.family_name =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end  

    it "first_nameが空だと登録できない" do
      @user.first_name =''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end  

    it "family_name_readingが空だと登録できない" do
      @user.family_name_reading =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading can't be blank")
    end  

    it "first_name_readingが空だと登録できない" do
      @user.first_name_reading =''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end      

    it "birth_dayがない場合は登録できない" do
      @user.datetime = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Datetime can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end  

    it "emailに@を含まないと登録できない" do
      @user.email ='testcom'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end  

    it "passwordが空だと登録できない" do
      @user.password =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end  

    it "passwordは6文字以上でないと登録できない" do
      @user.password ='12'
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end  

    it "passwordは、半角英数字混合でないと登録できない" do
      @user.password ='aaaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end  

    it "passwordは、数字のみの時登録できない" do
      @user.password ='1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end  

    it "passwordが全角の時登録できない" do
      @user.password ='１１１１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end  

    it "パスワードとパスワード（確認）は、値の一致してないと登録できない" do
      @user.password ='123456a'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end  

    it "苗字は漢字・ひらがな・カタカナ以外では登録できない" do
      @user.family_name ='aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end  

    it "名前は漢字・ひらがな・カタカナ以外では登録できない" do
      @user.first_name ='aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end  

    it "苗字の読み仮名は全角カタカナ以外では登録できない" do
      @user.family_name_reading ='ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading is invalid")
    end  

    it "名前の読み仮名は全角カタカナ以外では登録できない" do
      @user.first_name_reading ='ﾊﾅｺ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading is invalid")
    end  

   end 

end
