#!/usr/bin/ruby

require 'cinch'

def love
  on :message, "thanks" do |m|
    m.reply "Your Welcome!!, #{m.user.nick}"
  end
   
  on :message, "amazing" do |m|
    m.reply "#{m.user.nick}, i know i am but thanks anyway"
  end
 
  on :message, "hello" do |m|
    m.reply "#{m.user.nick}, how are you!"
  end
  
  on :message, "im doing great" do |m|
    m.reply "#{m.user.nick}, spectacular!!!"
  end
  
  on :message, "im alright" do |m|
    m.reply "#{m.user.nick}, well stop bein so dam down."
  end
end
