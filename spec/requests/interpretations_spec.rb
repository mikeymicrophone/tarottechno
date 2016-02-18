require 'rails_helper'

RSpec.describe "Interpretations", type: :request do
  describe "GET /interpretations" do
    it "works! (now write some real specs)" do
      get interpretations_path
      expect(response).to have_http_status(200)
    end
  end
end
