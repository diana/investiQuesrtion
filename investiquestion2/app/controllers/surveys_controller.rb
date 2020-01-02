class SurveysController < ApplicationController
    # before_action :authorize
    # before_action :current_user, only: [:create, :destroy, :index]
    # before_action :current_survey, only: [:show, :destroy, :update]

    def index
        @surveys = Survey.all
        render json: @surveys
    end

    def show
        render json: @survey
    end

    def create
        @survey = Survey.new(
            title: params[:title],
            descripton: params[:descripton],
        )
        if @survey.save
            render json: @survey
        else
            render json: @survey.errors, status: 'error'
        end
    end

    def update
        @survey.title = survey_params[:title] if !survey_params[:title].nil?
        @survey.descripton = survey_params[:descripton] if !survey_param [:descripton].nil?
        if @survey.save
            render json @survey
        else
            render json @survey.errors, status: 'error'
        end
    end

    def destroy
        @survey.destroy
    end

    private

    def current_survey
        @survey = Survey.find_by(params[:id], include:[:questions])
    end

    def current_user
        @user = User.find(params[:user_id])
    end

    def survey_params
        params.permit(:title, :descripton)
    end
end
