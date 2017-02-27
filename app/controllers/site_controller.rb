class SiteController < ApplicationController
  def index
    @sites=Site.all
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