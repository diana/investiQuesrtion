class UsersController < ApplicationController
    # before_action :authorize, only: [:show]
    before_action :current_user, only: [:show]

    def index 
        @users = User.all
        render json: @users
    end        

    def show
        render json: @user
    end

    def user_now
        render json: current_user
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render json: @user.errors, status: 'error'
        end
    end

    private

    def current_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:username, :email, :password) 
    end
end
