require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { FactoryBot.create(:event) }

  it "有効なファクトリを持つこと" do
    expect(event).to be_valid
  end

  it "稽古日がなければ無効" do
    event.event_day = nil
    event.valid?
    expect(event.errors[:event_day]).to include(I18n.t('errors.messages.blank'))
  end

  it "稽古日が今日より前であれば無効" do
    event.event_day = Date.today - 1
    event.valid?
    expect(event.errors[:event_day]).to include('は今日以降の稽古日にしてください')
  end

  it "稽古日が今日であれば有効" do
    event.event_day = Date.today
    expect(event).to be_valid
  end

  it "稽古日が次の日以降であれば有効" do
    event.event_day = Date.today + 1
    expect(event).to be_valid
  end

  it "開始時間がなければ無効" do
    event.start_time = nil
    event.valid?
    expect(event.errors[:start_time]).to include(I18n.t('errors.messages.blank'))
  end

  it "終了時間がなければ無効" do
    event.finish_time = nil
    event.valid?
    expect(event.errors[:finish_time]).to include(I18n.t('errors.messages.blank'))
  end

  it "終了時間が開始時間より早ければ無効" do
    event.finish_time = event.start_time - 1
    event.valid?
    expect(event.errors[:finish_time]).to include('は開始時間以降のにしてください')
  end

  it "開始時間が終了時間より早ければ有効" do
    event.finish_time = event.start_time + 1
    expect(event).to be_valid
  end

  it "都道府県がなければ無効" do
    event.prefecture = nil
    event.valid?
    expect(event.errors[:prefecture]).to include(I18n.t('errors.messages.blank'))
  end

  it "場所がなければ無効" do
    event.place = nil
    event.valid?
    expect(event.errors[:place]).to include(I18n.t('errors.messages.blank'))
  end

  it "住所がなければ無効" do
    event.address = nil
    event.valid?
    expect(event.errors[:address]).to include(I18n.t('errors.messages.blank'))
  end

  it "想定人数がなければ無効" do
    event.estimate_people = nil
    event.valid?
    expect(event.errors[:estimate_people]).to include(I18n.t('errors.messages.blank'))
  end

  it "想定人数が数字でなければ無効" do
    event.estimate_people = "テスト"
    event.valid?
    expect(event.errors[:estimate_people]).to include(I18n.t('errors.messages.not_a_number'))
  end

  it "想定人数が2以上でなければ無効" do
    event.estimate_people = 1
    event.valid?
    expect(event.errors[:estimate_people]).to include(I18n.t('errors.messages.greater_than_or_equal_to', count: 2))
  end

  it "想定人数が2人であれば有効" do
    event.estimate_people = 2
    expect(event).to be_valid
  end

  it "想定人数が100人であれば有効" do
    event.estimate_people = 100
    expect(event).to be_valid
  end

  it "想定人数が100以下でなければ無効" do
    event.estimate_people = 101
    event.valid?
    expect(event.errors[:estimate_people]).to include(I18n.t('errors.messages.less_than_or_equal_to', count: 100))
  end

  it "レベルがなければ無効" do
    event.level = nil
    event.valid?
    expect(event.errors[:level]).to include(I18n.t('errors.messages.blank'))
  end

  it "コメントがなければ無効" do
    event.comment = nil
    event.valid?
    expect(event.errors[:comment]).to include(I18n.t('errors.messages.blank'))
  end

  it "コメントが100文字以下であれば有効" do
    event.comment = "あ" * 100
    expect(event).to be_valid
  end

  it "コメントが100文字以上であれば無効" do
    event.comment = "あ" * 101
    event.valid?
    expect(event.errors[:comment]).to include(I18n.t('errors.messages.too_long', count: 100))
  end

  it "ユーザーIDがなければ無効" do
    event.user_id = nil
    expect(event).not_to be_valid
  end

  it "イベントファクトリで関連するデータを生成できること" do
    event = FactoryBot.create(:event)
    puts "This event's project is #{event.owner.inspect}"
  end
end
