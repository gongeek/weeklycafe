class WelcomeController < ApplicationController
  @@interval=7

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
    start_day = start_day
    end_day = end_day+1
    if @user
      good_site_ids=UserSite.where(user_id: @user.id).map { |site| site.site_id }
    else
      good_site_ids=Site.all.map { |site| site.id }
    end
    items=Item.includes(:site).where(:created_at => (start_day..end_day))
    @total=(items.reject { |item| !(good_site_ids.include? item.site_id) }).length
    @items_group=Item.group_by_day(items, good_site_ids)
  end

end