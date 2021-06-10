require 'rails_helper'

RSpec.describe "Relatioship", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @profile = FactoryBot.create(:profile, user: @user)
    @other_user = FactoryBot.create(:user, admin: true)
    @other_profile = FactoryBot.create(:profile, user: @other_user)
  end

  describe '登録済みユーザー' do
    it "他のユーザーをお気に入り登録できる" do
      login(@other_user)
      visit '/'
      visit "/users/#{@user.id}"
      click_on "フォローする"

      expect(page).to have_content "フォロー済み"
      expect(current_path).to eq "/users/#{@user.id}"
    end

    it "他のユーザーをお気に入り登録できる" do
      login(@other_user)
      visit '/'
      visit "/users/#{@user.id}"
      click_on "フォローする"

      expect(page).to have_content "フォロー済み"

      click_on "フォロー済み"

      expect(page).to have_content "フォローする"
    end
  end
end
