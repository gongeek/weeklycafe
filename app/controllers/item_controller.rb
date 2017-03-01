class ItemController < ApplicationController
  def show
    @item=Item.includes(:site).find_by_id(params[:id])
    @recent_items=Item.limit(5).order('id desc').where(:site_id => @item.site_id)
    @item.update(access_num: (@item.access_num||0) + 1)
  end


end
