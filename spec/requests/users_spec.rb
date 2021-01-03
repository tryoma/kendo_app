require 'rails_helper'

RSpec.describe "Users_controller", type: :request do

  let(:base_title) { 'KendoApp' }

  before do
    @user = FactoryBot.create(:user)
  end

  describe "GET /users/:id" do
    it "ユーザーページに遷移する" do
    end
  end
end
