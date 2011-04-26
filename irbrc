require "irb/completion"
require "rubygems"

# Assume a bundler-managed environment, so find and require the irb-specific
# enhancement gems directly. This does not do dependency tracking, so
# dependent gems must be explicitly specified!
def irb_require(gemname, lib=nil)
  # allow bundler or rubygems a fair shake at loading the library first
  require lib ? lib : gemname
rescue LoadError
  # didn't work? we'll do it ourself
  candidates = []

  ENV["GEM_PATH"].split(":").map {|p| p + "/gems" }.each do |path|
    Dir.glob(path + "/*").each do |entry|
      if File.directory?(entry) && File.basename(entry).start_with?(gemname)
        candidates << entry
      end
    end
  end

  if candidates.empty?
    raise LoadError, "could not load #{lib || gemname} via irb_require"
  else
    $:.push(candidates.sort.reverse.first + "/lib")
    require lib ? lib : gemname
  end
end

irb_require "wirble"
irb_require "looksee", "looksee"
irb_require "awesome_print", "ap"
irb_require "ffi" # unmentioned dependency of spoon
irb_require "spoon" # dependency of interactive_editor
irb_require "interactive_editor"

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
