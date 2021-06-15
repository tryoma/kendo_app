require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) { FactoryBot.create(:list) }

  it "有効なファクトリを持つこと" do
    expect(list).to be_valid
  end

  it "タイトルがなければ無効" do
    list.title = nil
    list.valid?
    expect(list.errors[:title]).to include(I18n.t('errors.messages.blank'))
  end

  it "タイトルが51文字以上であれば無効" do
    list.title = "あ" * 51
    list.valid?
    expect(list.errors[:title]).to include(I18n.t('errors.messages.too_long', count: 50))
  end

  it "タイトルが50文字以下であれば有効" do
    list.title = "あ" * 50
    expect(list).to be_valid
  end
end
