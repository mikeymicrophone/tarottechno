require 'rails_helper'

RSpec.describe "Decks", type: :request do
  describe "GET /decks" do
    it "works! (now write some real specs)" do
      get decks_path
      expect(response).to have_http_status(200)
    end
  end
end
