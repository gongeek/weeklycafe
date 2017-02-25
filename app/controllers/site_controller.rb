class SiteController < ApplicationController
  def index
    @sites=Site.all
  end
  def create
    puts params[:rss]
  end

end