namespace :update do
  desc '1.检测rss并更新数据。2.从临时文件取出rss生成地址'
  task :items => :environment do
    require 'feedjira'
    Site.all.each do |site|
      rss_url =URI.parse(URI.encode(site.rss.strip))
      feed = Feedjira::Feed.fetch_and_parse(rss_url)
      entry=feed.entries.first
      unless entry.url.eql? (site.recent_item_link)
        site.update(recent_item_link: entry.url)
        new_item=Item.new(name: entry.title, content: entry.summary, link: entry.url, site_id: site.id)
        new_item.save
      end
    end
  end
  task :sites => :environment do
    require 'feedjira'
    arr = IO.readlines(Rails.root.to_s + '/db/temporary_site')
    arr.each do |rss|
      rss.chomp
      rss.lstrip
      rss.rstrip
      unless rss.empty?||rss.nil?||Site.where(rss: rss).exists?
        begin
          rss_url =URI.parse(URI.encode(rss.strip))
          feed = Feedjira::Feed.fetch_and_parse(rss_url)
          new_site=Site.new(name: feed.title, rss: rss, url: feed.url, recent_item_link: '')
          new_site.save
          User.all.each do |user|
            new_user_site = UserSite.new(user_id: user.id, site_id: new_site.id)
            new_user_site.save
          end
        rescue
          puts "提交失败"+rss
          next
        end
      else
        puts "提交失败"+rss
      end
    end
    puts "提交完成"
    File.open(Rails.root.to_s + '/db/temporary_site', 'w') { |file| file.truncate(0) }
  end
end