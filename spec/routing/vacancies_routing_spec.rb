require "rails_helper"

RSpec.describe VacanciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/vacancies").to route_to("vacancies#index")
    end

    it "routes to #show" do
      expect(:get => "/vacancies/1").to route_to("vacancies#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/vacancies").to route_to("vacancies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/vacancies/1").to route_to("vacancies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/vacancies/1").to route_to("vacancies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vacancies/1").to route_to("vacancies#destroy", :id => "1")
    end
  end
end
