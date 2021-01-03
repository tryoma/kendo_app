require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:member){FactoryBot.create(:member)}

  it "有効なファクトリを持つこと" do
    expect(member).to be_valid
  end

  it "ユーザーIDがなければ無効" do
    member.user_id = nil
    expect(member).not_to be_valid
  end

  it "イベントIDがなければ無効" do
    member.event_id = nil
    expect(member).not_to be_valid
  end
end
