require_relative 'commum_methods'

class NoticeController < ApplicationController
	skip_before_action :verify_authenticity_token
	include CommumMethods

	def index
		@notices = Notice.all
		
		respond_to do |format|
			format.json { render json: @notices.to_json }
		end
	end

	def show_selected
		self.filter_by_course
	end
end