class UsersController < ApplicationController
	def index
		@user = User.all 
		render json: @user
	end


	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			render json: @user
		end
	end

	def show
		@user = User.find_by(id: params[:id])
		render json: @user
	end

	def update
	end

private
	def user_params
		params.require(:user).permit(:username, :email, :password, :avatar)
	end
end
