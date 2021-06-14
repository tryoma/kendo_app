require 'rails_helper'

RSpec.describe "Profile", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @profile = FactoryBot.create(:profile, user: @user)
  end

  describe '登録済みユーザー' do
    xit "プロフィールの編集ができる" do
      login(@user)
      visit '/'
      visit "/users/#{@user.id}"
      click_button 'PF編集'
      fill_in '道場', with: 'テスト道場'
      click_button '編集'

      expect(page).to have_content "#{@user.profile.name}のプロフィールを更新しました。"
      expect(page).to have_content 'テスト道場'
      expect(current_path).to eq "/users/#{@user.id}"
    end
  end
end
