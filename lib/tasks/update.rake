namespace :update do
  desc '检测rss并更新数据'
  task :items => :environment do
    require 'feedjira'
    Site.all.each do |site|
      rss_url=site.rss
      feed = Feedjira::Feed.fetch_and_parse(rss_url)
      entry=feed.entries.first
      unless entry.url.equal? (site.recent_item_link)
        site.update(recent_item_link: entry.url)
        new_item=Item.new(name: entry.title, content: entry.summary, link: entry.url, site_id: site.id)
        new_item.save
      end
    end
  end
end