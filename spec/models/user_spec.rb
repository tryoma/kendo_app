require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メール、パスワードがあれば有効な状態であること" do
    user = User.new(
      user_name: "Aaron",
      email: "test@example.com",
      password: "password",
    )
    expect(user).to be_valid
  end
  it "名前がなければ無効な状態であること" do
    user = User.new(user_name: nil)
    user.valid?
    expect(user.errors[:user_name]).to include(I18n.t('errors.messages.blank'))
  end

  it "メールアドレスがなければ無効な状態であること" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include(I18n.t('errors.messages.blank'))
  end
  it "重複したメールアドレスなら無効な状態であること" do
    user = User.create(
      user_name: "Aaron",
      email: "test@example.com",
      password: "password",
    )
    user = User.new(
      user_name: "John",
      email: "test@example.com",
      password: "password",
    )
    user.valid?
    expect(user.errors[:email]).to include(I18n.t('errors.messages.taken'))
  end
end
