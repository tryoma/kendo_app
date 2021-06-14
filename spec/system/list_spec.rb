require 'rails_helper'

RSpec.describe "List", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @profile = FactoryBot.create(:profile, user: @user)
  end

  describe '登録済みユーザー' do
    xit "新規TODOを作成できる" do
      login(@user)
      visit '/'
      visit "/users/#{@user.id}"
      click_button 'TODO'
      find('.form-control').set('test')
      click_on 'メモを追加'

      expect(page).to have_content 'test'
      expect(current_path).to eq '/lists'
    end

    xit "TODOを削除できる" do
      login(@user)
      visit '/'
      visit "/users/#{@user.id}"
      click_button 'TODO'
      find('.form-control').set('test')
      click_on 'メモを追加'

      expect(page).to have_content 'test'
      expect(current_path).to eq '/lists'

      click_on '削除'

      expect(page).not_to have_content 'test'
      expect(current_path).to eq '/lists'
    end
  end
end
