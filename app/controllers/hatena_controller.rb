class HatenaController < ApplicationController

  def search
    require 'open-uri'
    require 'json'
    
    @url = params[:url]

    if @url.blank?
      @url = ""
      return
    end

    html = open(@url).read
    json = JSON.parser.new(html)

    @users = html

    #parse()
    hash = json.parse()
    parsed = hash['bookmarks']
    @title = hash['title']
    @entry_url = hash['entry_url']
    
    @timestamps = Array.new(parsed.length)
    @comments = Array.new(parsed.length)
    @users = Array.new(parsed.length)
    @tags = Array.new(parsed.length)

    parsed.each_with_index do |item, i|
      @timestamps[i] = item['timestamp']
      @comments[i] = item['comment']
      @users[i] = item['user']
      @tags[i] = item['tags']
    end

  end
end
