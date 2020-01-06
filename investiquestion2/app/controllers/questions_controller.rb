class QuestionsController < ApplicationController
    def index
        @questions = Question.all
        render json: @questions
    end

    def show
        render json: @question
    end

    def create
        @question = Question.new(
            question: params[:question],
            questionType: params[:questionType],
            choices: params[:choices],
            survey_id: params[:survey_id]
        )
        if @question.save
            render json: @question
        else
            render json: @question.errors, status: 'error'
        end
    end

    def update
        @question.question = question_params[:question] if !question_params[:question].nil?
        @question.questionType = question_params[:questionType] if !question_params[:questionType].nil?
        @question.choices = question_params[:choices] if !question_param [:choices].nil?
        if @question.save
            render json @question
        else
            render json @question.errors, status: 'error'
        end
    end

    def destroy
        @question.destroy
    end

    private

    def current_question
        @question = question.find_by(params[:id], include:[:questions])
    end

    def current_user
        @user = User.find(params[:survey_id])
    end

    def question_params
        params.permit(:question, :questionType, :choices, :survey_id)
    end
end
