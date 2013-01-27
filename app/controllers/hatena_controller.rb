# -*- encoding: utf-8 -*-

class HatenaController < ApplicationController

  API_URL = "http://b.hatena.ne.jp/entry/json/"

  def search
    require 'open-uri'
    require 'json'

    parsed=['']
    @url = params[:url]
    @timestamps = Array.new(parsed.length)
    @comments = Array.new(parsed.length)
    @users = Array.new(parsed.length)
    @tags = Array.new(parsed.length)

    if @url.blank?
      @url = ""
      @alert = "URLを入力してください。"
      return
    end

    # 入力されたURLをJSONで展開する
    begin
      html = open(API_URL+@url).read
      json = JSON.parser.new(html)
      hash=json.parse()

    rescue
      @alert="URLが間違っています。\n正しく入力してください。"
      return
    end

    if hash.present?
      parsed = hash['bookmarks']
      @title = hash['title']
      @entry_url = hash['entry_url']
    else
      @alert="データがありません。"
      return
    end
    
    parsed.each_with_index do |item, i|
      @timestamps[i] = item['timestamp']
      @comments[i] = item['comment']
      @users[i] = item['user']
      @tags[i] = item['tags']
    end
  end


  def display
    @scraps = Scrap.all
  end
end
