#!/usr/bin/ruby

require 'cinch'

def hate 
  on :message, "shut up bot.nick" do |m|
    m.reply "Thats not nice, #{m.user.nick}"
  end
   
  on :message, "damit" do |m|
    m.reply "#{m.user.nick}, calm down now son"
  end
 
  on :message, "Bcb0t suck" do |m|
   m.reply "#{m.user.nick}, fuck you!"
  end
  
  on :message, "ponies?" do |m|
    m.reply "#{m.user.nick}, you a fairy r summin"
  end
  
  on :message, "wheres miui?" do |m|
    m.reply "#{m.user.nick}, shhhh."
  end
end
