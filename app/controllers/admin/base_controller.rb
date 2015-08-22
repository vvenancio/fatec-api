class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!

  private
  def authenticate_admin!
    if current_user.nil? || !current_user.admin?  
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end