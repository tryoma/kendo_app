require 'rails_helper'

RSpec.describe "Member", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @profile = FactoryBot.create(:profile, user: @user)
    @other_user = FactoryBot.create(:user, admin: true)
    @other_profile = FactoryBot.create(:profile, user: @other_user)
    @event = FactoryBot.create(:event, owner: @user)
  end

  describe '登録済みユーザー' do
    xit "イベントに参加しメンバーになれる" do
      login(@other_user)
      visit '/'
      click_on "#{@event.place}"
      page.accept_confirm do
        click_on '参加しますか？'
      end

      expect(page).to have_content '参加予定しました。'
      expect(page).to have_content '1人'
      expect(current_path).to eq "/events/#{@event.id}"
    end

    xit "イベントの参加をキャンセルできる" do
      login(@other_user)
      visit '/'
      click_on "#{@event.place}"
      page.accept_confirm do
        click_on '参加しますか？'
      end

      expect(page).to have_content '参加予定しました。'
      expect(page).to have_content '1人'
      expect(current_path).to eq "/events/#{@event.id}"

      page.accept_confirm do
        click_on '参加取りやめ'
      end

      expect(page).to have_content '取りやめました。'
      expect(page).to have_content '0人'
      expect(current_path).to eq "/events/#{@event.id}"
    end

    xit "参加予定のイベントをマイページで確認できる" do
      login(@other_user)
      visit '/'
      click_on "#{@event.place}"
      page.accept_confirm do
        click_on '参加しますか？'
      end
      visit "/users/#{@user.id}"

      expect(page).to have_content "#{@event.place}"
    end
  end
end
