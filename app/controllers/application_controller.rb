class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :set_user_info

  def set_user_info
    if login?
      @user=User.find_by_id(session[:user_id])
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
