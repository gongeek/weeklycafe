require 'date'
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
      "just now"
    elsif s/60== 0
      return (s).to_s +" seconds ago"
    elsif s/(60*60) == 0
      return (s/60).to_s + " minutes ago"
    elsif s/(60*60*24) == 0
      return (s/(60*60)).to_s + " hour ago"
    else
      (s/(60*60*24)).to_s + " days ago"
    end
  end

  def extract_day_e(day)
    day.strftime("%B")[0..2].upcase
  end

  def extract_day_d(day)
    day.to_s.split('-')[2]
  end

  def extract_day_z(day)
    day.month.to_s+'月'+day.day.to_s+'日'
  end

end
