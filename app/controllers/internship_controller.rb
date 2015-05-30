require_relative 'commum_methods'

class InternshipController < ApplicationController
	skip_before_action :verify_authenticity_token
	include CommumMethods

	def index
		@internships = Internship.all.includes([:enterprise, :courses])
		
		respond_to do |format|
			format.json { render json: @internships.order('internships.id desc').to_json(include: [:enterprise, :courses]) }
		end
	end

	def show_selected
		self.filter_by_course :internships
	end
end