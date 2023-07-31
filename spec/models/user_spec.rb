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
        user = User.new(nickname: '')
        user.valid?
        binding.pry
      end
      it "emailが空では登録できない" do
      end
      it "emailが登録済みのものだと登録できない" do
      end
      it "email@が含まれないと登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが6文字以下では登録できない" do
      end
      it "passwordが全角では登録できない" do
      end
      it "passwordが数字を含まないと登録できない" do
      end
      it "passwordが英字を含まないと登録できない" do
      end
      it "encrypted_passwordが空では登録できない" do
      end
      it "encrypted_passwordとpasswordが合致しないと登録できない" do
      end
      it "last_nameが空では登録できない" do
      end
      it "last_nameが英字のみでは登録できない" do
      end
      it "last_nameが数字のみでは登録できない" do
      end
      it "last_nameが半角では登録できない" do
      end
      it "first_nameが空では登録できない" do
      end
      it "first_nameが英字のみでは登録できない" do
      end
      it "first_nameが数字のみでは登録できない" do
      end
      it "first_nameが半角では登録できない" do
      end
      it "last_name_phoneticが空では登録できない" do
      end
      it "last_name_phoneticが英字のみでは登録できない" do
      end
      it "last_name_phoneticが数字のみでは登録できない" do
      end
      it "last_name_phoneticがひらがなでは登録できない" do
      end
      it "last_name_phoneticが漢字では登録できない" do
      end
      it "first_name_phoneticが空では登録できない" do
      end
      it "first_name_phoneticが英字のみでは登録できない" do
      end
      it "first_name_phoneticが数字のみでは登録できない" do
      end
      it "first_name_phoneticがひらがなでは登録できない" do
      end
      it "first_name_phoneticが漢字では登録できない" do
      end
      it "birth_dayが空では登録できない" do
      end
    end
  end
end

#bundle exec rspec spec/models/user_spec.rb
#user.errors.full_messages