require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:record){FactoryBot.create(:record)}

  it "有効なファクトリを持つこと" do
    expect(record).to be_valid
  end

  it "ユーザーIDがなければ無効" do
    record.user_id = nil
    expect(record).not_to be_valid
  end

  it "日時がなければ無効" do
    record.start_time = nil
    record.valid?
    expect(record.errors[:start_time]).to include(I18n.t('errors.messages.blank'))
  end

  it "タイトルが101文字以上であれば無効" do
    record.title = "あ" * 101
    record.valid?
    expect(record.errors[:title]).to include(I18n.t('errors.messages.too_long',count: 100))
  end

  it "タイトルが100文字であれば有効" do
    record.title = "あ" * 100
    expect(record).to be_valid
  end

  it "内容が401文字以上であれば無効" do
    record.content = "あ" * 401
    record.valid?
    expect(record.errors[:content]).to include(I18n.t('errors.messages.too_long',count: 400))
  end

  it "内容が100文字であれば有効" do
    record.content = "あ" * 400
    expect(record).to be_valid
  end
end
