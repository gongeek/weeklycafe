# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Site.create(
    name: "JavaScript Weekly",
    url: "http://javascriptweekly.com/",
    recent_item_link: "http://javascriptweekly.com/issues/322",
    rss: "http://javascriptweekly.com/rss/10m068ld")

Site.create(
    name: "Go Newsletter",
    url: "http://golangweekly.com/",
    recent_item_link: "http://golangweekly.com/issues/147",
    rss: "http://golangweekly.com/rss/185ijbgh")
Site.create(
    name: "Mobile Web Weekly",
    url: "http://mobilewebweekly.co/",
    recent_item_link: "http://mobilewebweekly.co/issues/145",
    rss: "http://mobilewebweekly.co/rss/1o9o2fej")
Site.create(
    name: "React Status",
    url: "http://react.statuscode.com/",
    recent_item_link: "http://react.statuscode.com/issues/24",
    rss: "http://react.statuscode.com/rss/16782l49")
Site.create(
    name: "Web Operations Weekly",
    url: "http://webopsweekly.com/",
    recent_item_link: "http://webopsweekly.com/issues/103",
    rss: "http://webopsweekly.com/rss/1m8b57fh")