class HatenaController < ApplicationController
  def search
    require 'open-uri'
    require 'json'
    
    url = params[:url]

    html = open(url).read
    json = JSON.parser.new(html)
    puts json.class

    #parse()
    hash = json.parse()
    parsed = hash['related']

    parsed.each do |link|
      puts link['title']
    end
  end
end
