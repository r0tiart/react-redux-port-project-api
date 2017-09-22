class WorksController < ApplicationController
	def index

		if params[:user_id]
			@user = User.find_by(id: params[:user_id])
			@works = @user.works
		else	
			@works = Work.all.select{ |work|  work.show_attribute }
		end

		@json_works = @works.collect{|work| 
					{ title: work.title, id: work.id, description: work.description, category_id: work.category_id,
					 user_id: work.user_id, show_attribute: work.show_attribute, avatar: work.avatar_full_url } } 

		render json: @json_works

	end


	def create
	
		@work = current_user.works.build(work_params)

		
	end

	def show
		@work = Work.find_by(id: params[:id])

		@work.update(work_params)

   		render :json => @work.to_json(:only => [:id, :title, :description, :category_id, :user_id, :show_attribute], 
   						:methods => [:full_url])
   			
		
	end

private
	def work_params
		params.fetch(:work, {}).permit(:title, :description, :category_id, :show_attribute, :avatar)
	end
end
