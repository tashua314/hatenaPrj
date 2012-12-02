class HatenaController < ApplicationController

  def search
    require 'open-uri'
    require 'json'
    
    url = params[:url]

    if url == nil || url == ""
      return
    end

    html = open(url).read
    json = JSON.parser.new(html)
    puts json.class

    #parse()
    hash = json.parse()
    parsed = hash['bookmarks']
    @title = hash['title']
    @entry_url = hash['entry_url']

    #@users = Array.new(parsed.length)
    @users = "testt"

#    parsed.each_with_index do |item, i|
#      @timestamps[i] = item['timestamp']
#      @comments[i] = item['comment']
#      @users[i] = item['user']
     # @tags[i] = item['tags']
#    end
#@items = html
  end
end
