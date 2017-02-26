class SiteController < ApplicationController
  def index
    @sites=Site.all
  end

  def create
    @rss = params[:rss][:rss]
    require 'feedjira'
    feed = Feedjira::Feed.fetch_and_parse(@rss)
    entry=feed.entries.first
    puts entry.to_yaml
    new_site=Site.new(name: feed.title, rss: @rss, url: feed.url, recent_item_link: entry.url)
    new_site.save
  end

  def show
    id=params[:id]
    @site=Site.find_by_id(id)
  end

end