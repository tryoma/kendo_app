require 'rails_helper'

RSpec.describe "Favorite", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @profile = FactoryBot.create(:profile, user: @user)
    @other_user = FactoryBot.create(:user, admin: true)
    @other_profile = FactoryBot.create(:profile, user: @other_user)
    @information = FactoryBot.create(:information, user: @user)
  end

  describe '登録済みユーザー' do
    it "情報のお気に入り登録ができる" do
      login(@other_user)
      visit '/'
      click_on "#{@information.title}"
      click_on "0"

      expect(page).to have_content '1'
      expect(current_path).to eq "/informations/#{@information.id}"
    end

    it "情報のお気に入り解除ができる" do
      login(@other_user)
      visit '/'
      click_on "#{@information.title}"
      click_on "0"

      expect(page).to have_content '1'

      click_on "1"

      expect(page).to have_content '0'
      expect(current_path).to eq "/informations/#{@information.id}"
    end
  end
end
