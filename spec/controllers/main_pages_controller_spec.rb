require 'rails_helper'

RSpec.describe MainPagesController, type: :controller do
  render_views
  
  describe "#top" do
    it "正常にレスポンスを返すこと" do
      get :top
      expect(response).to have_http_status "200"
    end
  end
end
