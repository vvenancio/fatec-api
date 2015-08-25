class NoticesController < ApplicationController
  before_action :authenticate_user!

  def index
		@notices = Notice.all.order(id: :desc)

		respond_to do |format|
			format.json { render json: @notices.to_json }
		end
	end
end
