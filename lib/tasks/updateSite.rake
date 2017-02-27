namespace :updateSite do
  desc '从临时文件取出rss生成地址'
  task :sites => :environment do
    require 'feedjira'
    arr = IO.readlines(Rails.root.to_s + '/db/temporarySite')
    arr.each do |rss|
      unless rss.empty?||rss.nil?
        encoded_url = URI.encode(rss)
        rss_url =URI.parse(encoded_url)
        feed = Feedjira::Feed.fetch_and_parse(rss_url)
        entry=feed.entries.first
        new_site=Site.new(name: feed.title, rss: rss_url, url: feed.url, recent_item_link: entry.url)
        new_site.save
        User.all.each do |user|
          new_user_site = UserSite.new(user_id: user.id,site_id: new_site.id)
          new_user_site.save
        end
      end
    end
  end
end
