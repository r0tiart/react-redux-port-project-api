class WorksController < ApplicationController
	def index
		@work = Work.all.select{ |work|  work.show_attribute } 
		render json: @work
	end


	def create
	
		@work = current_user.works.build(work_params)

		
	end

	def show
		@work = Work.find_by(id: params[:id])
		render json: @work
	end

private
	def work_params
		params.fetch(:work, {}).permit(:title, :description, :category_id, :show_attribute, :avatar)
	end
end
