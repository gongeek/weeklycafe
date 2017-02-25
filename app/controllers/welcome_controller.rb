class WelcomeController < ApplicationController
  def index
    if @user
      good_site_ids=UserSite.where(user_id: @user.id).map { |site| site.site_id }
    else
      good_site_ids=Site.all.map { |site| site.id }
    end
    items=Item.includes(:site).where('created_at >= ?', Time.now-7.days)
    @items_group=Item.group_by_day(items, good_site_ids)
  end
end