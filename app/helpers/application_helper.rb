# -*- coding: utf-8 -*-

module ApplicationHelper
  def purse_html(url)

    require 'logger'
    require 'openssl'
    require 'open-uri'
    require 'nokogiri'

    logger = Logger.new(STDOUT)

    json = {}
    begin
      if url =~ /http[s]?\:\/\/[\w\+\$\;\?\.\%\,\!\#\~\*\/\:\@\&\\\=\_\-]+/
        res = open(url, "r",{:ssl_verify_mode=>OpenSSL::SSL::VERIFY_NONE})
        doc = Nokogiri::HTML(res, nil, 'utf-8')

        # はてぶ用
        json[:entry_title] = 
          doc.css("a.entry-link").first.inner_text
        json[:url] = 
          doc.css("a.entry-link").first.attribute("href").value
        json[:entry_summary] = 
          doc.css("blockquote").first.inner_text
      else
        raise "不明なプロトコルなため処理を中断"
      end
    rescue Exception => e
      logger.error "error-message:" + e.message
    end
    json
  end
end
