require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、お名前(全角)姓とお名前(全角)名、お名前カナ(全角)姓とお名前カナ(全角)名、生年月日が存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'aa0000'
        @user.password_confirmation = 'aa0000'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'お名前(全角)姓が空では登録できないこと' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'お名前(全角)名が空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'お名前カナ(全角)姓が空では登録できないこと' do
        @user.full_width_character = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width character can't be blank")
      end

      it 'お名前カナ(全角)名が空では登録できないこと' do
        @user.full_width_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Full width katakana can't be blank")
      end

      it '生年月日が空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'メールアドレスに＠を含まないと登録ができないこと' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードは確認用を含めて2回入力しなければ登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）で入力しなければ登録できないこと' do
        @user.family_name = 'aaAA00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid. Input full_width characters.')
      end

      it 'ユーザー本名のフリガナは、全角（カタカナ）で入力しなければ登録できないこと' do
        @user.full_width_katakana = '太郎たろうaaAA00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Full width katakana is invalid. Input full_width katakana characters.')
      end
    end
  end
end
