#!/usr/bin/env ruby

# originally from from http://errtheblog.com/posts/89-huba-huba

home = File.expand_path(ENV['HOME'])

Dir['*'].each do |file|
  next if file =~ /install|tags|README/
  target = File.join(home, ".#{file}")
  if File.exist?(target)
    puts "skipping #{file}, already installed"
  else
    puts "installing #{File.expand_path file} to #{target}"
    `ln -s -i #{File.expand_path file} #{target}`
  end
end
