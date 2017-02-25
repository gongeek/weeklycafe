module ApplicationHelper
  def login?
    !session[:user_id].blank?
  end

  def current_url
    request.original_url
  end
end
