require 'irb/completion'

require 'rubygems'
require 'wirble'
require 'looksee/shortcuts'
require "ap" # awesome print

IRB.conf[:AUTO_INDENT]=true

Wirble.init
# Wirble.colorize

def t; b = Time.now; yield; Time.now-b; end

module Enumerable
  def histogram
    h = Hash.new(0)
    # each do |entry|
    self.each do |entry|
      key = nil
      if block_given?
        key = yield entry
      else
        key = entry
      end
      # key = block_given? ? yield(entry) : entry
      h[key] = h[key] + 1
      # h[key] += 1
    end
    return h
    # h
  end
end

%w(foo bar baz mumble thing what damn).histogram
# => {"mumble"=>1, "baz"=>1, "foo"=>1, "thing"=>1, "what"=>1, "bar"=>1, "damn"=>1}
%w(foo bar baz mumble thing what damn).histogram { |word| word.size }
# => {5=>1, 6=>1, 3=>3, 4=>2}
{:foo => 1, :bar => 1, :baz => 2, :mumble => 1}.histogram
# => {[:bar, 1]=>1, [:mumble, 1]=>1, [:baz, 2]=>1, [:foo, 1]=>1}
{:foo => 1, :bar => 1, :baz => 2, :mumble => 1}.histogram { |k,v| v }
# => {1=>3, 2=>1}
