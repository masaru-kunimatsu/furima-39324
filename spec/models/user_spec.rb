require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nickname、email、passwordとpassword_confirmation、last_name、first_name、last_name_phonetic、first_name_phonetic、birth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが登録済みのものだと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "email@が含まれないと登録できない" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが6文字以下では登録できない" do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
      end
      it "passwordが全角では登録できない" do
        @user.password = '１２３４A５'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end
      it "passwordが数字を含まないと登録できない" do
        @user.password = 'absdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end
      it "passwordが英字を含まないと登録できない" do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end
      it "encrypted_passwordとpasswordが合致しないと登録できない" do
        @user.password = '123456'
        @user.encrypted_password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it "last_nameが英字のみでは登録できない" do
        @user.last_name = 'akatsuki'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "last_nameが数字のみでは登録できない" do
        @user.last_name = '46494649'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "last_nameが半角では登録できない" do
        @user.last_name = 'ｱｶﾂｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "first_nameが英字のみでは登録できない" do
        @user.first_name = 'akatsuki'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "first_nameが数字のみでは登録できない" do
        @user.first_name = '46494649'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "first_nameが半角では登録できない" do
        @user.first_name = 'ｱｶﾂｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_name_phoneticが空では登録できない" do
        @user.last_name_phonetic = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name phonetic can't be blank", "Last name phonetic is invalid")
      end
      it "last_name_phoneticが英字のみでは登録できない" do
        @user.last_name_phonetic = 'akatsuki'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name phonetic is invalid")
      end
      it "last_name_phoneticが数字のみでは登録できない" do
        @user.last_name_phonetic = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name phonetic is invalid")
      end
      it "last_name_phoneticがひらがなでは登録できない" do
        @user.last_name_phonetic = 'あかつき'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name phonetic is invalid")
      end
      it "last_name_phoneticが漢字では登録できない" do
        @user.last_name_phonetic = '暁'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name phonetic is invalid")
      end
      it "first_name_phoneticが空では登録できない" do
        @user.first_name_phonetic = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name phonetic can't be blank", "First name phonetic is invalid")
      end
      it "first_name_phoneticが英字のみでは登録できない" do
        @user.first_name_phonetic = 'akatsuki'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name phonetic is invalid")
      end
      it "first_name_phoneticが数字のみでは登録できない" do
        @user.first_name_phonetic = '46494649'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name phonetic is invalid")
      end
      it "first_name_phoneticがひらがなでは登録できない" do
        @user.first_name_phonetic = 'あかつき'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name phonetic is invalid")
      end
      it "first_name_phoneticが漢字では登録できない" do
        @user.first_name_phonetic = '暁'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name phonetic is invalid")
      end
      it "birth_dayが空では登録できない" do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end

#bundle exec rspec spec/models/user_spec.rb
#@user.errors.full_messages