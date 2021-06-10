require 'rails_helper'

RSpec.describe "Comment", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @profile = FactoryBot.create(:profile, user: @user)
    @other_user = FactoryBot.create(:user, admin: true)
    @other_profile = FactoryBot.create(:profile, user: @other_user)
    @event = FactoryBot.create(:event, owner: @user)
  end

  describe '登録済みユーザー' do
    it "自分のイベントに対してコメントができる" do
      login(@user)
      visit '/'
      click_on "#{@event.place}"
      fill_in 'comment_body', with: 'テストで入力中です。'
      click_on 'コメントをする'

      expect(page).to have_content 'テストで入力中です。'
      expect(current_path).to eq "/events/#{@event.id}"
    end

    it "他人のイベントに対してコメントができる" do
      login(@other_user)
      visit '/'
      click_on "#{@event.place}"
      fill_in 'comment_body', with: 'テストで入力中です。'
      click_on 'コメントをする'

      expect(page).to have_content 'テストで入力中です。'
      expect(current_path).to eq "/events/#{@event.id}"
    end
  end
end
