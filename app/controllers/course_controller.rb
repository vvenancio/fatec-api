class CourseController < ApplicationController
	def index
		@courses = Course.all
		
		respond_to do |format|
			format.json { render json: @courses.to_json }
		end
	end

	def show
		@course = Course.find(params[:id])
		
		respond_to do |format|
			format.json { render json: @course.to_json }
		end
	end
end