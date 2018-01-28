require "irb/completion"
require 'irb/ext/save-history'
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

def timed; b = Time.now; value = yield; puts Time.now-b.inspect; value; end

module Enumerable
  def histogram
    h = Hash.new(0)
    self.each do |entry|
      key = block_given? ? yield(entry) : entry
      h[key] += 1
    end
    return h
  end

  # from @glv
  def uniq_c(&blk)
    (blk ? group_by(&blk) : group_by { |o| o }).map { |k, a| [k, a.size] }
  end

  def avg(&blk)
    (blk ? map(&blk) : self).sum.to_f / size
  end
end

# Project-specific .irbrc
if Dir.pwd != File.expand_path("~")
  local_irbrc = File.expand_path '.irbrc'
  if File.exist? local_irbrc
    load local_irbrc
  end
end

def copy(*args)
  IO.popen('pbcopy', 'r+') do |clipboard|
    clipboard.puts args.map(&:inspect)
  end
end
