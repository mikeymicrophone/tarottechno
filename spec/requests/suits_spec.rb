require 'rails_helper'

RSpec.describe "Suits", type: :request do
  describe "GET /suits" do
    it "works! (now write some real specs)" do
      get suits_path
      expect(response).to have_http_status(200)
    end
  end
end
