#!/usr/bin/ruby

$LOAD_PATH << './lib'
require 'cinch'
require 'open-uri'
require 'nokogiri'
require 'cgi'
require 'love.rb'
require 'hate.rb'
require 'informer.rb'
require 'google.rb'

bot = Cinch::Bot.new do
  configure do |c|
    c.server   = "irc.freenode.org"
    c.nick     = "Bcb0t"
    c.channels = ["#thebcblends"]
  end
  
  informer
  love
  hate
  google     
  
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
