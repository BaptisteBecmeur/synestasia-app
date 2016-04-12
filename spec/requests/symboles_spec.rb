require 'rails_helper'

RSpec.describe "Symboles", type: :request do
  describe "GET /symboles" do
    it "works! (now write some real specs)" do
      get symboles_path
      expect(response).to have_http_status(200)
    end
  end
end
