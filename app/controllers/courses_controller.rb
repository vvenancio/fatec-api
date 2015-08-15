class CoursesController < ApplicationController
	respond_to :html, :json

	def index
		@courses = Course.all
		respond_with  @courses
	end

	def show
		@course = Course.find(params[:id])
		
		respond_to do |format|
			format.json { render json: @course.to_json }
		end
	end
end