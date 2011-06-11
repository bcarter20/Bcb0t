#!/usr/bin/ruby

require 'cinch'
require 'nokogiri'
require 'cgi'

def google
  helpers do
    def google(query)
      url = "http://www.google.com/search?q=#{CGI.escape(query)}"
      res = Nokogiri::HTML(open(url)).at("h3.r")

      title = res.text
      link = res.at('a')[:href]
      desc = res.at("./following::div").children.first.text
    rescue
      "No results found"
    else
      CGI.unescape_html "#{title} - #{desc} (#{link})"
    end
  end

  on :message, /^!google (.+)/ do |m, query|
    m.reply google(query)
  end
end
