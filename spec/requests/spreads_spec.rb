require 'rails_helper'

RSpec.describe "Spreads", type: :request do
  describe "GET /spreads" do
    it "works! (now write some real specs)" do
      get spreads_path
      expect(response).to have_http_status(200)
    end
  end
end
