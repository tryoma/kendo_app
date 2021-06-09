require 'rails_helper'

RSpec.describe Information, type: :model do
  let(:information) { FactoryBot.create(:information) }

  it "有効なファクトリを持つこと" do
    expect(information).to be_valid
  end

  it "タイトルがなければ無効" do
    information.title = nil
    information.valid?
    expect(information.errors[:title]).to include(I18n.t('errors.messages.blank'))
  end

  it "タイトルが11文字以上であれば無効" do
    information.title = "あ" * 51
    information.valid?
    expect(information.errors[:title]).to include(I18n.t('errors.messages.too_long', count: 10))
  end

  it "タイトルが10文字以下であれば有効" do
    information.title = "あ" * 10
    expect(information).to be_valid
  end

  it "内容が201文字以上であれば無効" do
    information.body = "あ" * 201
    information.valid?
    expect(information.errors[:body]).to include(I18n.t('errors.messages.too_long', count: 200))
  end

  it "内容が200文字以下であれば有効" do
    information.body = "あ" * 200
    expect(information).to be_valid
  end

  it "内容がなければ無効" do
    information.body = nil
    information.valid?
    expect(information.errors[:body]).to include(I18n.t('errors.messages.blank'))
  end

  it "期限がなければ無効" do
    information.limited = nil
    information.valid?
    expect(information.errors[:limited]).to include(I18n.t('errors.messages.blank'))
  end

  it "Youtube_URLがフォーマットでなければ無効" do
    information.youtube_url = "https://youtu.be/aaaaaaaaaaaaa"
    information.valid?
    expect(information.errors[:youtube_url]).to include(I18n.t('errors.messages.invalid'))
  end

  it "ユーザーIDがなければ無効" do
    information.user_id = nil
    expect(information).not_to be_valid
  end
end
