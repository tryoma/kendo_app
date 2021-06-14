require 'rails_helper'

RSpec.describe "Event", type: :system do
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
    xit "新規イベントが作成できる" do
      login(@user)
      visit '/'
      visit '/events/new'
      fill_in '稽古日', with: '2021-08-20'
      fill_in '開始時間', with: '10:00'
      fill_in '終了時間', with: '12:00'
      select '東京都', from: '都道府県'
      fill_in '場所', with: '日本武道館'
      fill_in '住所', with: '東京都千代田区北の丸公園2番3号'
      fill_in '想定人数', with: '4'
      select 'だれでもOK', from: 'レベル'
      fill_in 'コメント', with: '一緒に稽古しましょう！'
      click_on '新規作成'

      expect(page).to have_content '新規作成に成功しました。'
      expect(current_path).to eq '/events/2'
    end

    it "イベントが編集できる" do
      login(@user)
      visit '/'
      visit "/users/#{@user.id}"
      click_on "#{@event.place}"
      click_link '編集'
      visit "/events/#{@event.id}/edit"
      fill_in 'コメント', with: '更新します'
      click_on '編集'

      expect(page).to have_content '稽古会情報を更新しました。'
      expect(current_path).to eq "/events/#{@event.id}"
    end

    xit "イベントが削除できる" do
      login(@user)
      visit '/'
      visit "/users/#{@user.id}"
      click_on "#{@event.place}"
      page.accept_confirm do
        click_link '削除'
      end

      expect(page).to have_content "#{@event.place}の稽古会を削除しました。"
      expect(current_path).to eq "/users/#{@user.id}"
    end

    it "主催予定のイベントをマイページで確認できる" do
      login(@user)
      visit '/'
      click_on "#{@event.place}"
      visit "/users/#{@user.id}"

      expect(page).to have_content "#{@event.place}"
    end
  end

  describe '管理者ユーザー' do
    xit "イベント一覧からイベントを削除できる" do
      login(@admin_user)
      visit '/'
      visit '/events'
      page.accept_confirm do
        click_on '削除'
      end

      expect(page).to have_content "#{@event.place}の稽古会を削除しました。"
      expect(current_path).to eq "/events"
    end
  end
end
