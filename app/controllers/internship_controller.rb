class InternshipController < ApplicationController
	def index
		@internships = Internship.all
		
		respond_to do |format|
			format.json { render json: @internships.to_json }
		end
	end

	def show_selected
		@course_selected = params[:ids].split(',')
		course ||= []

		@course_selected.each do |element|
			internship = Course.find(element.to_i).internships
			
			unless course.include? internship
				course << internship
			end
		end

		respond_to do |format|
			format.json { render json: course.to_json }
		end
	end
end