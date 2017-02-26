class ItemController < ApplicationController
  def show
    puts params.to_yaml
    @item=Item.includes(:site).find_by_id(params[:id])
    @recent_items=Item.limit(5).order('id desc').where(:site_id => @item.site_id)
  end


end
