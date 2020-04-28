class UsersController < ApplicationController
    def index
        render :index
    end

    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
             log_in_user!(@user)
        else
            render :new
        end

    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end