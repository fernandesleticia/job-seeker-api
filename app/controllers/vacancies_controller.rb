    require 'net/http'
    
    class VacanciesController < ApplicationController
      before_action :set_vacancy, only: [:show, :update, :destroy]

      # GET /vacancies
      def index
        @vacancies = Vacancy.all

        render json: @vacancies
      end

      # GET /vacancies/1
      def show
        render json: @vacancy
      end

      # POST /vacancies
      def create
        @vacancy = Vacancy.new(vacancy_params)

        if @vacancy.save
          render json: @vacancy, status: :created, location: @vacancy
        else
          render json: @vacancy.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /vacancies/1
      def update
        if @vacancy.update(vacancy_params)
          render json: @vacancy
        else
          render json: @vacancy.errors, status: :unprocessable_entity
        end
      end

      # DELETE /vacancies/1
      def destroy
        @vacancy.destroy
      end

      # /vacancies/{:id}/activate
      def activate
        @vacancy = Vacancy.find(params[:id])
        @vacancy.update_attribute(:status, "activated")
      end

      #/category/{:id}
      def percentage
        @vacancy = Vacancy.find(params[:id])
        @results = Vacancy.percent_by_category
        render json: @results
      end

      #/loadJobs
      def loadJobs
        url = URI.parse('http://localhost:8080/jobs')
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
          http.request(req)
        }
        puts res.body
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_vacancy
          @vacancy = Vacancy.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def vacancy_params
          params.require(:vacancy).permit(:partnerId, :title, :categoryId, :expiresAt, :status)
        end
    end
