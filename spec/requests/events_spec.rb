require 'rails_helper'

RSpec.describe "Events_controller", type: :request do
  let(:base_title) { 'KendoApp' }

  before do
    @user = FactoryBot.create(:user)
    sign_in @user
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
      get events_path(@event.id)
      expect(response).to have_http_status(200)
    end
  end

  #new
  describe "GET /events/new" do
    it "新規作成ページに遷移する" do
      get new_event_path
      expect(response).to have_http_status(200)
    end
  end
  
  #create
  describe "POST /events/:id" do
    it "イベントを作成できる" do
      post edit_event_path(@event.id)
      expect(response).to have_http_status(200)
    end
  end

  #edit
  describe "GET /events/:id" do
    it "個別イベント編集ページに遷移する" do
      get events_path(@event.id)
      expect(response).to have_http_status(200)
    end
  end

  #update
  describe "PATCH /events/:id" do
    it "個別イベントページを更新できる" do
      patch events_path(@event.id)
      expect(response).to have_http_status(200)
    end
  end

  #destroy
  describe "DELETE /events/:id" do
    it "個別イベントページを削除できる" do
      delete events_path(@event.id)
      expect(response).to have_http_status(200)
    end
  end
end
