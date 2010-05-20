require 'irb/completion'
def t; b = Time.now; yield; Time.now-b; end

# load libraries
require 'rubygems'
require 'wirble'

Wirble.init
# Wirble.colorize

IRB.conf[:AUTO_INDENT]=true

class Object
  def tap
    yield self
    self
  end
end

module Enumerable
  def histogram(&block)
    h = Hash.new(0)
    each do |entry|
      key = block_given? ? yield(entry) : entry
      h[key] += 1
    end
    h
  end
end

def connect_to_s3(persistent = true)
  require 'aws/s3'
  AWS::S3::Base.establish_connection!(
    :access_key_id => ENV["AMAZON_ACCESS_KEY_ID"],
    :secret_access_key => ENV["AMAZON_SECRET_ACCESS_KEY"],
    :use_ssl => true,
    :persistent => persistent
  )
end

# require "hirb"
# Hirb.enable

require 'looksee/shortcuts'

require "ap" # awesome print
