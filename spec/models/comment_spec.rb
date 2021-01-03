require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment){FactoryBot.create(:comment)}

  it "有効なファクトリを持つこと" do
    expect(comment).to be_valid
  end

  it "コメントがなければ無効" do
    comment.body = nil
    comment.valid?
    expect(comment.errors[:body]).to include(I18n.t('errors.messages.blank'))
  end

  it "コメントが141文字以上であれば無効" do
    comment.body = "あ" * 141
    comment.valid?
    expect(comment.errors[:body]).to include(I18n.t('errors.messages.too_long',count: 140))
  end

  it "コメントが140文字以下であれば有効" do
    comment.body = "あ" * 140
    expect(comment).to be_valid
  end

  it "ユーザーIDがなければ無効" do
    comment.user_id = nil
    comment.valid?
    expect(comment.errors[:user_id]).to include(I18n.t('errors.messages.blank'))
  end

  it "イベントIDがなければ無効" do
    comment.event_id = nil
    comment.valid?
    expect(comment.errors[:event_id]).to include(I18n.t('errors.messages.blank'))
  end

  it 'userを削除すると、userが書いたコメントも削除されること' do
    @user = FactoryBot.create(:user)
    @event = FactoryBot.create(:event)
    @user.comments.create(event_id: @event.id, body: 'テスト')
    expect{ @user.destroy }.to change{ Comment.count }.by(-1)
  end
end
