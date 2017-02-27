namespace :updateSite do
  desc '检测rss并更新数据'
  task :sites => :environment do
    require 'feedjira'
    arr = IO.readlines(Rails.root.to_s + '/db/temporarySite')

    arr.each do |site|
      unless site.empty?||site.nil?
        encoded_url = URI.encode(site)
        rss_url =URI.parse(encoded_url)
        feed = Feedjira::Feed.fetch_and_parse(rss_url)
        entry=feed.entries.first
        new_site=Site.new(name: feed.title, rss: rss_url, url: feed.url, recent_item_link: entry.url)
        new_site.save
      end
    end
  end
end
