require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end  

  describe "ユーザー新規登録" do
    it "family_nameが空だと登録できない" do
      @user.family_name =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end  
  end  

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end  
  end  

  describe "ユーザー新規登録" do
    it "emailが空だと登録できない" do
      @user.email =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end  
  end  

  describe "ユーザー新規登録" do
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end  
  end  

  describe "ユーザー新規登録" do
    it "emailに@を含まないと登録できない" do
      @user.email ='testcom'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end  
  end
  
  describe "ユーザー新規登録" do
    it "passwordが空だと登録できない" do
      @user.password =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end  
  end  

  describe "ユーザー新規登録" do
    it "passwordは6文字以上でないと登録できない" do
      @user.password ='12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end  
  end  

  describe "ユーザー新規登録" do
    it "passwordは6文字以上でないと登録できない" do
      @user.password ='12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end  
  end  

  describe "ユーザー新規登録" do
    it "passwordは、半角英数字混合でないと登録できない" do
      @user.password ='aaaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end  
  end  
  
  describe "ユーザー新規登録" do
    it "パスワードとパスワード（確認）は、値の一致が必須であること" do
      @user.password ='123456a'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end  
  end  

end
