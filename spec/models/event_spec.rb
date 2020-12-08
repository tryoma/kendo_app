require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @user = User.create(
      user_name: "Aaron",
      email: "test@example.com",
      password: "password",
    )
  end

  it "稽古日がなければ無効" do
    event = @user.events.create(
      event_day: nil
    )
    event.valid?
    expect(event.errors[:event_day]).to include(I18n.t('errors.messages.blank'))
  end

  it "開始時間がなければ無効" do
    event = @user.events.create(
      start_time: nil
    )
    event.valid?
    expect(event.errors[:start_time]).to include(I18n.t('errors.messages.blank'))
  end

  it "終了時間がなければ無効" do
    event = @user.events.create(
      finish_time: nil
    )
    event.valid?
    expect(event.errors[:finish_time]).to include(I18n.t('errors.messages.blank'))
  end

  it "都道府県がなければ無効" do
    event = @user.events.create(
      prefecture: nil
    )
    event.valid?
    expect(event.errors[:prefecture]).to include(I18n.t('errors.messages.blank'))
  end

  it "場所がなければ無効" do
    event = @user.events.create(
      place: nil
    )
    event.valid?
    expect(event.errors[:place]).to include(I18n.t('errors.messages.blank'))
  end

  it "想定人数がなければ無効" do
    event = @user.events.create(
      estimate_people: nil
    )
    event.valid?
    expect(event.errors[:estimate_people]).to include(I18n.t('errors.messages.blank'))
  end

  it "レベルがなければ無効" do
    event = @user.events.create(
      level: nil
    )
    event.valid?
    expect(event.errors[:level]).to include(I18n.t('errors.messages.blank'))
  end

  it "コメントがなければ無効" do
    event = @user.events.create(
      comment: nil
    )
    event.valid?
    expect(event.errors[:comment]).to include(I18n.t('errors.messages.blank'))
  end

  it "イベントファクトリで関連するデータを生成できること" do
    event = FactoryBot.create(:event)
    puts "This event's project is #{event.owner.inspect}"
  end
end
