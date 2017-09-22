class UsersController < ApplicationController

	def index
		@users = User.all.collect{|user| {username: user.username, id: user.id, avatar: user.avatar.url}}
		render json: {users: @users}
	end


	def create
		
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
   			render :json => @user.to_json(:only => [:id,:username,:email], :methods => [:full_url])
   			
		end
	end

	def show
		@user = User.find_by(id: params[:id])
		render json: {username: @user.username, email: @user.email, avatar: @user.avatar}
	end

private
	def user_params
		params.fetch(:user, {}).permit(:username, :password, :avatar, :email)
	end
end
