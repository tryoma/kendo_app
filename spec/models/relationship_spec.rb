require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:relationship) { FactoryBot.create(:relationship) }

  it "有効なファクトリを持つこと" do
    expect(relationship).to be_valid
  end
end
