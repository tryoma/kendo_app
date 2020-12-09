require 'rails_helper'

RSpec.feature "Events", type: :feature do
  scenario "ユーザーは新しい稽古会を作成する" do
    user = FactoryBot.create(:user)
    visit root_path
  end
end
