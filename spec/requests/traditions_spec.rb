require 'rails_helper'

RSpec.describe "Traditions", type: :request do
  describe "GET /traditions" do
    it "works! (now write some real specs)" do
      get traditions_path
      expect(response).to have_http_status(200)
    end
  end
end
