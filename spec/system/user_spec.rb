require 'rails_helper'

RSpec.describe "User", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @profile = FactoryBot.create(:profile, user: @user)
    @admin_user = FactoryBot.create(:user, admin: true)
    @admin_profile = FactoryBot.create(:profile, user: @admin_user)
    @event = FactoryBot.create(:event, owner: @user)
    @information = FactoryBot.create(:information, user: @user)
    @record = FactoryBot.create(:record, user: @user)
  end

  describe '新規ユーザー' do
    it "新規ユーザー登録ができる" do
      visit '/'
      visit '/users/sign_in'
      click_link 'アカウント登録'
      fill_in 'ユーザー名', with: 'テスト１'
      fill_in 'メールアドレス', with: 'sample@test.com'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード再入力', with: 'password'
      find('.btn').click

      expect(page).to have_content 'ログインに成功しました'
      expect(current_path).to eq root_path
    end
  end

  describe 'ゲストユーザー' do
    it "ログインができる" do
      visit '/'
      click_on 'ゲストログイン（閲覧用）'

      expect(page).to have_content 'ゲストユーザーとしてログインしました。'
      expect(current_path).to eq root_path
    end
  end

  describe '登録済みユーザー' do
    it "ログインができる" do
      visit '/'
      visit '/users/sign_in'
      fill_in 'メールアドレス', with: "#{@user.email}"
      fill_in 'パスワード', with: 'password'
      find('.btn').click

      expect(page).to have_content 'ログインに成功しました'
      expect(current_path).to eq root_path
    end

    it "ユーザー情報編集ができる" do
      login(@user)
      visit '/'
      visit "/users/edit.#{@user.id}"
      fill_in 'ユーザー名', with: '田中太郎'
      fill_in '現在のパスワード', with: 'password'
      find('#edit_user .btn').click

      expect(page).to have_content 'アカウント情報を変更しました。'
      expect(current_path).to eq root_path

      @user.reload
      aggregate_failures do
        expect(@user.user_name).to eq '田中太郎'
      end
    end

    it "ログアウトができる" do
      login(@user)
      visit '/'
      click_on 'Log out'

      expect(page).to have_content 'ログアウトしました'
    end

    it "マイページに遷移できる" do
      login(@user)
      visit '/'
      visit "/users/#{@user.id}"

      expect(page).to have_content "#{@user.user_name}"
      expect(page).to have_content '段位：未設定'
      expect(page).to have_content '出身地：未設定'
    end
  end

  describe '管理者ユーザー' do
    it "ログインができる" do
      visit '/'
      visit '/users/sign_in'
      fill_in 'メールアドレス', with: "#{@admin_user.email}"
      fill_in 'パスワード', with: 'password'
      find('.btn').click

      expect(page).to have_content 'ログインに成功しました'
      expect(current_path).to eq root_path
    end

    it "ユーザー一覧に遷移できる" do
      login(@admin_user)
      visit '/'
      visit '/users'

      expect(page).to have_content 'ユーザー一覧'
      expect(page).to have_content "#{@user.user_name}"
      expect(page).to have_content "#{@admin_user.user_name}"
    end

    it "ユーザー一覧からユーザーを削除できる" do
      login(@admin_user)
      visit '/'
      visit '/users'
      page.accept_confirm do
        click_on '削除'
      end

      expect(page).to have_content "#{@user.user_name}のデータを削除しました。"
      expect(current_path).to eq "/users"
    end

    it "稽古会一覧に遷移できる" do
      login(@admin_user)
      visit '/'
      visit '/events'

      expect(page).to have_content 'ユーザー一覧'
      expect(page).to have_content "#{@event.place}"
    end

    it "情報一覧に遷移できる" do
      login(@admin_user)
      visit '/'
      visit '/informations'

      expect(page).to have_content '情報一覧'
      expect(page).to have_content "#{@information.title}"
    end

    it "ユーザー情報編集ができる" do
      login(@admin_user)
      visit '/'
      visit "/users/edit.#{@admin_user.id}"
      fill_in 'ユーザー名', with: '田中次郎'
      fill_in '現在のパスワード', with: 'password'
      find('#edit_user .btn').click

      expect(page).to have_content 'アカウント情報を変更しました。'
      expect(current_path).to eq root_path

      @admin_user.reload
      aggregate_failures do
        expect(@admin_user.user_name).to eq '田中次郎'
      end
    end
  end
end
