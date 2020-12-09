require 'rails_helper'

RSpec.describe "Users_controller", type: :request do

  let(:base_title) { 'KendoApp' }

  before do
    @user = FactoryBot.create(:user)
  end

  describe "GET /users/:id" do
    it "ユーザーページに遷移する" do
      get user_path(@user.id)
      expect(response).to have_http_status(200)
      expect(response.body).to match(/<title> #{@user.user_name} | #{base_title}<\/title>/i)
    end
  end
end
