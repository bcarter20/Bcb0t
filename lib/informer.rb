#!/usr/bin/ruby

require 'cinch'

def informer
  on :message, "twitter?" do |m|
    m.reply "Bcnice20's twitter is @bcarter20', #{m.user.nick}"
  end
  
  on :message, "miui?" do |m|
    m.reply "#{m.user.nick}, here it is http://bit.ly/jxmWG8"
  end
  
  on :message, "kernel?" do |m|
    m.reply "#{m.user.nick}, here it is http://bit.ly/isPOMh"
  end
  
  on :message, "help?" do |m|
    m.reply "#{m.user.nick}, get a logcat.."
  end
 
  on :message, "Bcb0t" do |m|
    m.reply "#{m.user.nick}, I am everthing awesome thrown into one package"
  end
end
