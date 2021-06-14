require 'rails_helper'

RSpec.describe "Record", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @profile = FactoryBot.create(:profile, user: @user)
    @other_user = FactoryBot.create(:user, admin: true)
    @other_profile = FactoryBot.create(:profile, user: @other_user)
    @record = FactoryBot.create(:record, user: @user)
  end

  describe '登録済みユーザー' do
    xit "新規日記が作成できる" do
      login(@user)
      visit '/'
      visit "/users/#{@user.id}"
      click_button '稽古日記'
      click_link '稽古日記を入力'
      fill_in '日付', with: '2021-08-31'
      fill_in 'タイトル', with: '初投稿'
      fill_in '本文', with: 'テストで入力'
      click_button '記録する'

      expect(page).to have_content '稽古日記を投稿しました！'
      expect(current_path).to eq "/users/#{@user.id}/records"
    end

    xit "他のユーザーが日記を見れる" do
      login(@other_user)
      visit '/'
      visit "/users/#{@user.id}"
      click_button '稽古日記'

      expect(page).to have_content '稽古日記カレンダー'
      expect(current_path).to eq "/users/#{@user.id}/records"
    end
  end
end
