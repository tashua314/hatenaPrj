class ScrapController < ApplicationController

  require 'nokogiri'

  include ApplicationHelper

  HTML = "http://b.hatena.ne.jp/"

  def scrap
    @json = purse_html(HTML)

    @output = create(@json)
  end

  def create(data)
    @scrap = Scrap.new
    #@scrap.increment(:id)
    @scrap.entry_title = data[:entry_title]
    @scrap.entry_summary = data[:entry_summary]
    @scrap.url = data[:url]
    @scrap.update_date = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    @scrap.create_date = Time.now.strftime("%Y-%m-%d %H:%M:%S")

    output = @scrap.save
  end
end
