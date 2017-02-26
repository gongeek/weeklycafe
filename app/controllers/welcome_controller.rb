class WelcomeController < ApplicationController
  @@interval=2

  def index
    today=Date.current
    start_day=today-@@interval
    group start_day, today
  end

  def add
    page=params[:page]
    end_day=Date.current-@@interval*(page.to_i-1)
    start_day=end_day-@@interval
    group start_day, end_day
  end

  private
  def group (start_day, end_day)
    if @user
      good_site_ids=UserSite.where(user_id: @user.id).map { |site| site.site_id }
    else
      good_site_ids=Site.all.map { |site| site.id }
    end
    items=Item.includes(:site).where(:created_at => (start_day..end_day))
    @items_group=Item.group_by_day(items, good_site_ids)
  end

end