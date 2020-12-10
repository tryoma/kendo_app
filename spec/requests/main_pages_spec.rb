require 'rails_helper'

RSpec.describe "MainPages_controller", type: :request do
  let(:base_title) { 'KendoApp' }

  describe "GET / " do
    it "rootに遷移する" do
      get '/'
      expect(response).to have_http_status(200)
      expect(response.body).to match(/<title> Top | #{base_title}<\/title>/i)
    end
  end
end
