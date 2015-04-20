require_relative 'commum_methods'

class NoticeController < ApplicationController
	include CommumMethods

	def index
		@notices = Notice.all
		
		respond_to do |format|
			format.json { render json: @notices.to_json }
		end
	end

	def show_selected
		@course_selected = params[:ids].split(',')
		self.filter_by_course(@course_selected)
	end
end