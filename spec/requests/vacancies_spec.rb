require 'rails_helper'

RSpec.describe "Vacancies", type: :request do
  describe "GET /vacancies" do
    it "works! (now write some real specs)" do
      get vacancies_path
      expect(response).to have_http_status(200)
    end
  end
end
