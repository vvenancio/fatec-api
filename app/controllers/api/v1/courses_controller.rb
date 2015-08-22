class Api::V1::CoursesController < Api::V1::BaseController
  def index
    respond_with Course.all.to_json
  end
end
