class EnterpriseController < ApplicationController
	def index
		@courses = Course.all
		
		respond_to do |format|
			format.json { render :json => @courses.to_json }
		end
	end
end
