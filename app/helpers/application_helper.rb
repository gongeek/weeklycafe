module ApplicationHelper
  def login?
    !session[:user_id].blank?
  end

  def current_url
    request.original_url
  end

  def time_interval(time)
    require 'date'
    s = (Time.now.to_i - time.to_i)
    if s == 0
      return "刚刚"
    elsif s/60== 0
      return (s).to_s +"秒前"
    elsif s/(60*60) == 0
      return (s/60).to_s  + "分钟前"
    elsif s/(60*60*24) == 0
      return (s/(60*60)).to_s  + "小时前"
    else
      return (s/(60*60*24)).to_s + "天前"
    end
  end
end
