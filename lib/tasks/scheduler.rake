desc "This task is called by the Heroku scheduler add-on"

def create(data)
  @scrap = Scrap.new
  @scrap.entry_title = data[:entry_title]
  @scrap.entry_summary = data[:entry_summary]
  @scrap.url = data[:url]

  output = @scrap.save
end


task :update_feed => :environment do
  include ApplicationHelper

  puts "Updating feed..."

  require 'nokogiri'

  HTML = "http://b.hatena.ne.jp/"

  json = purse_html(HTML)

  if create(json)
    puts "done."
  else
    puts "miss..."
  end
end


task :send_reminders => :environment do
  User.send_reminders
end
