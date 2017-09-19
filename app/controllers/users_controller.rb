class UsersController < ApplicationController
	def index
		@user = User.all 
		render json: @user
	end

	def new
	end

	def create
	end

	def show
	end

	def update
	end

	def destroy
	end

private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end
