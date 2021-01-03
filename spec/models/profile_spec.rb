require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:profile){FactoryBot.create(:profile)}

  it "有効なファクトリを持つこと" do
    expect(profile).to be_valid
  end

  it "ユーザーIDがなければ無効" do
    profile.user_id = nil
    expect(profile).not_to be_valid
  end

  it "名前がなければ無効" do
    profile.name = nil
    profile.valid?
    expect(profile.errors[:name]).to include(I18n.t('errors.messages.blank'))
  end

  it "自己紹介が101文字以上であれば無効" do
    profile.description = "あ" * 101
    profile.valid?
    expect(profile.errors[:description]).to include(I18n.t('errors.messages.too_long',count: 100))
  end

  it "自己紹介が100文字であれば有効" do
    profile.description = "あ" * 100
    expect(profile).to be_valid
  end

  it "出身道場が51文字以上であれば無効" do
    profile.dojo = "あ" * 51
    profile.valid?
    expect(profile.errors[:dojo]).to include(I18n.t('errors.messages.too_long',count: 50))
  end

  it "出身道場が50文字であれば有効" do
    profile.dojo = "あ" * 50
    expect(profile).to be_valid
  end

end
