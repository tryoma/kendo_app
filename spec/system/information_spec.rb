require 'rails_helper'

RSpec.describe "Information", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @profile = FactoryBot.create(:profile, user: @user)
    @admin_user = FactoryBot.create(:user, admin: true)
    @admin_profile = FactoryBot.create(:profile, user: @admin_user)
    @event = FactoryBot.create(:event, owner: @user)
    @information = FactoryBot.create(:information, user: @user)
    @record = FactoryBot.create(:record, user: @user)
  end

  describe '登録済みユーザー' do
    it "新規情報が作成できる" do
      login(@user)
      visit '/'
      visit '/informations/new'
      fill_in 'タイトル', with: '結婚しました！'
      fill_in '内容', with: 'この度、私剣道大好きケンコさんと結婚しました。'
      fill_in '期限', with: '2021-08-31'
      fill_in 'Youtube_URL', with: 'https://youtu.be/6jlP9FLApzo'
      click_on '新規作成'

      expect(page).to have_content '新規作成に成功しました。'
      expect(current_path).to eq '/informations/2'
    end

    it "情報が編集できる" do
      login(@user)
      visit '/'
      click_on "#{@information.title}"
      click_link '編集'
      fill_in 'タイトル', with: '変更します！'
      click_on '編集'

      expect(page).to have_content '情報を更新しました。'
      expect(current_path).to eq "/informations/#{@information.id}"
    end

    it "情報が削除できる" do
      login(@user)
      visit '/'
      click_on "#{@information.title}"
      page.accept_confirm do
        click_link '削除'
      end
      
      expect(page).to have_content "#{@information.title}のデータを削除しました。"
      expect(current_path).to eq root_path
    end
  end
  
  describe '管理者ユーザー' do
    it "情報一覧から情報を削除できる" do
      login(@admin_user)
      visit '/'
      visit '/informations'
      page.accept_confirm do
        click_on '削除'
      end

      expect(page).to have_content "#{@information.title}のデータを削除しました。"
      expect(current_path).to eq "/informations"
    end
  end
end
