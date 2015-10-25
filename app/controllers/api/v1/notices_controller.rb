class Api::V1::NoticesController < Api::V1::BaseController
  def index
    respond_with Notice.all.to_json
  end
end
