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
    @rss = params[:rss][:rss]
    aFile = File.open(Rails.root.to_s + '/db/temporarySite', "a")
    if aFile
      aFile.puts @rss
    else
      puts "Unable to open file!"
    end
    aFile.close
  end

  def show
    id=params[:id]
    @site=Site.find_by_id(id)
  end

end