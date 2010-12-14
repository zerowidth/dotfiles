require 'irb/completion'

require 'rubygems'
require 'wirble'
require 'looksee/shortcuts'
require "ap" # awesome print
require "interactive_editor"

IRB.conf[:AUTO_INDENT]=true

# make overridden methods purple instead of black
Looksee.styles[:overridden] = "\e[1;35m%s\e[0m"

Wirble.init
# Wirble.colorize

def t; b = Time.now; yield; Time.now-b; end

module Enumerable
  def histogram
    h = Hash.new(0)
    self.each do |entry|
      key = block_given? ? yield(entry) : entry
      h[key] += 1
    end
    return h
  end
end
