class WorksController < ApplicationController
	def index

		if params[:user_id]
			@user = User.find_by(id: params[:user_id])
			@works = @user.works
		else	
			@works = Work.all.select{ |work|  work.show_attribute }
		end

		@json_works = @works.collect{|work| 
					{ id: work.id, title: work.title, description: work.description, category_id: work.category_id,
					 user_id: work.user_id, show_attribute: work.show_attribute, avatar_full_url: work.avatar_full_url } } 

		render json: @json_works

	end


	def create
		
		@user = User.find_by(id: params["uid"])
		@work = @user.works.build(work_params)

		@pattern = @work.build_pattern()
		@pattern.document = params[:pattern][:document]

		if @work.save
			render :json => @work.to_json(:only => [:id, :title, :description, :category_id, :user_id, :show_attribute], 
   									:methods => [:avatar_full_url])
		end
		
	end

	def update
		@work = Work.find_by(id: params[:id])

		if !!@work.pattern
			@work.pattern.document = work_params[:pattern]
		else 
						binding.pry

			@pattern = Pattern.new() 

			@pattern.document = work_params[:pattern]

		end
		if @work.update(work_params)

   		render :json => @work.to_json(:only => [:id, :title, :description, :category_id, :user_id, :show_attribute], 
   						:methods => [:avatar_full_url])
   		end
	end

private
	def work_params
		params.fetch(:work, {}).permit(:title, :description, :category_id, :show_attribute, :avatar, :pattern)
	end
end
