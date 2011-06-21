#!/usr/bin/ruby

require 'cinch'

def random
  on :message, "its hard" do |m|
    m.reply "Thats what she said!!"
  end
   
  on :message, "its long" do |m|
    m.reply "Thats what she said!!"
  end
 
  on :message, "it doesnt fit" do |m|
    m.reply "Thats what she said!!"
  end
  
  on :message, "put it in" do |m|
    m.reply "Thats what she said!!!"
  end
  
  on :message, "fuck me" do |m|
    m.reply "Thats what she said!!!"
  end

	on :message, "harder" do |m|
    m.reply "Thats what she said!!!"
  end
end
