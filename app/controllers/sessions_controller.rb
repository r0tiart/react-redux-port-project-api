class SessionsController < ApplicationController

	def create
		@user = User.find_by(username: params["user"]["username"])

		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			render :json => @user.to_json(:only => [:id,:username,:email], :methods => [:full_url])

			# render json: {username: @user.username, email: @user.email, avatar: @user.avatar}
		end
	end

	def destroy
		session.destroy
	end

private 
	def login_params
		params.fetch(:user, {}).permit(:username, :password)
	end
end
