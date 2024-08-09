require 'rails_helper'

RSpec.describe "health monitor", type: :request do
  describe "GET /health.json" do
    it "returns 200" do
      get '/health.json'
      expect(response).to have_http_status(200)
      expect(response.body).to include('OK')
    end
  end
end
