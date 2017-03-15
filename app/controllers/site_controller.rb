require 'will_paginate/array'
class SiteController < ApplicationController
  def index
    @sites=Site.all
    if @user
      @user_site_ids=@user.user_site.map { |v| v.site_id }
    end
  end

  def sub
    site_id=params[:id]
    @user_site=UserSite.new(:site_id => site_id, :user_id => @user.id)
    @user_site.save
  end

  def del_sub
    site_id=params[:id]
    @user_site=UserSite.where(:site_id => site_id, :user_id => @user.id).first
    @user_site.destroy
  end

  def create
    if login?
      @rss = rss_params[:rss]
      a_file = File.open(Rails.root.to_s + '/db/temporary_site', 'a')
      if a_file
        a_file.puts @rss
      else
        puts "Unable to open file!"
      end
      a_file.close
      respond_to do |format|
        format.json do
          render json: {ok: true}
        end
      end
    else
      respond_to do |format|
        format.json do
          render json: {ok: false}
        end
      end
    end

  end

  def show
    id=params[:id]
    @site = Site.find_by_id(id)
    @items =@site.item.reverse.paginate(page: params[:page], per_page: 10)
  end

  private
  def rss_params
    params.permit(:rss)
  end

end