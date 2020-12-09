require 'rails_helper'

RSpec.describe "Events_controller", type: :request do
  let(:base_title) { 'KendoApp' }

  before do
    @user = FactoryBot.create(:user)
    @event = FactoryBot.create(:event)
  end

  #index
  describe "GET /events" do
    it "イベント一覧ページに遷移する" do
      get events_path
      expect(response).to have_http_status(200)
    end
  end

  #show
  describe "GET /events/:id" do
    it "個別イベントページに遷移する" do
      sign_in @user
      get events_path(@event.id)
      expect(response).to have_http_status(200)
    end
  end

  #new
  describe "GET /events/new" do
    it "新規作成ページに遷移する" do
      sign_in @user
      get new_event_path
      expect(response).to have_http_status(200)
    end
  end
  
  #edit
  describe "GET /events/:id" do
    it "個別イベント編集ページに遷移する" do
      sign_in @user
      get events_path(@event.id)
      expect(response).to have_http_status(200)
    end
  end

  #destroy
  describe "DELETE /events/:id" do
    it "個別イベントページを削除できる" do
      sign_in @user
      delete event_path(@event.id)
      expect(response).to have_http_status(204)
    end
  end
end
