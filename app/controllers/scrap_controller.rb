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
    @scrap.entry_title = data[:entry_title]
    @scrap.entry_summary = data[:entry_summary]
    @scrap.url = data[:url]

    output = @scrap.save
  end
end
