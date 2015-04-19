class NoticeController < ApplicationController
	def index
		@notices = Notice.all
		
		respond_to do |format|
			format.json { render json: @notices.to_json }
		end
	end

	def show_selected
		@notice_selected = params[:ids].split(',')
		course ||= []

		@notice_selected.each do |element|
			notice = Course.find(element.to_i).notices
			
			unless course.include? notice
				course << notice
			end
		end

		respond_to do |format|
			format.json { render json: course.to_json }
		end
	end
end