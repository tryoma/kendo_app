require 'rails_helper'

RSpec.describe User, type: :model do
  it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "名前、メール、パスワードがあれば有効な状態であること" do
    user = User.new(
      user_name: "Aaron",
      email: "test@example.com",
      password: "password"
    )
    expect(user).to be_valid
  end
  it "名前がなければ無効な状態であること" do
    user = FactoryBot.build(:user, user_name: nil)
    user.valid?
    expect(user.errors[:user_name]).to include(I18n.t('errors.messages.blank'))
  end

  it "メールアドレスがなければ無効な状態であること" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include(I18n.t('errors.messages.blank'))
  end
  it "重複したメールアドレスなら無効な状態であること" do
    FactoryBot.create(:user, email: "aaron@example.com")
    user = FactoryBot.build(:user, email: "aaron@example.com")
    user.valid?
    expect(user.errors[:email]).to include(I18n.t('errors.messages.taken'))
  end
end
