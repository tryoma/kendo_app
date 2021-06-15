require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:favorite) { FactoryBot.create(:favorite) }

  it "有効なファクトリを持つこと" do
    expect(favorite).to be_valid
  end

  it "ユーザーIDがなければ無効" do
    favorite.user_id = nil
    expect(favorite).not_to be_valid
  end

  it "情報IDがなければ無効" do
    favorite.information_id = nil
    expect(favorite).not_to be_valid
  end
end
