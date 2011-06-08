#!/usr/bin/ruby

require 'cinch'
require 'open-uri'
require 'nokogiri'
require 'cgi'

bot = Cinch::Bot.new do
  configure do |c|
    c.server   = "irc.freenode.org"
    c.nick     = "Bcb0t"
    c.channels = ["#thebcblends"]
  end
  
  helpers do
    # Extremely basic method, grabs the first result returned by Google
    # or "No results found" otherwise
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
  
  on :message, "hello" do |m|
    m.reply "Hello, #{m.user.nick}"
  end
  
  on :message, "goodbye" do |m|
  	m.reply "goodbye #{m.user.nick}"
  end
  
  on :message, "miui?" do |m|
    m.reply "#{m.user.nick}, here it is http://bit.ly/jxmWG8"
  end
  
  on :message, "kernel?" do |m|
    m.reply "#{m.user.nick}, here it is http://bit.ly/isPOMh"
  end
  
  on :message, "damit" do |m|
  	m.reply "#{m.user.nick}, calm down now son"
  end
 
   on :message, "Bcb0t" do |m|
    m.reply "#{m.user.nick}, How may i help you"
  end
  
  on :message, "ponies?" do |m|
    m.reply "#{m.user.nick}, you a fairy r summin"
  end
  
  on :message, "thanks" do |m|
  	m.reply "#{m.user.nick}, i kno i kno im awesome."
  end
  
  class Seen < Struct.new(:who, :where, :what, :time)
	  def to_s
	    "[#{time.asctime}] #{who} was seen in #{where} saying #{what}"
	  end
	end
	  
  @users = {}

  # Only log channel messages
  on :channel do |m|
    @users[m.user.nick] = Seen.new(m.user.nick, m.channel, m.message, Time.new)
  end

  on :channel, /^!seen (.+)/ do |m, nick|
    if nick == bot.nick
      m.reply "That's me foo!"
    elsif nick == m.user.nick
      m.reply "That's you stupid!"
    elsif @users.key?(nick)
      m.reply @users[nick].to_s
    else
      m.reply "I haven't seen #{nick}"
    end
  end
  
  on :message, /^!msg (.+?) (.+)/ do |m, who, text|
  	User(who).send text
  end  
end

bot.start
