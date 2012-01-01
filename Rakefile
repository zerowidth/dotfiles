load "plugins.rake"

# link the .vimrc and .gvimrc files
task :link_configs do
  dotvim = File.expand_path("~/.vim")
  unless File.exist?(dotvim)
    puts "linking .vim"
    ln_s(Dir.pwd, dotvim)
  end

  %w[ vimrc gvimrc ].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      puts "linking #{file}"
      ln_s(File.expand_path(file), dest)
    end
  end
end

desc "install the vimfiles and plugins"
task :install => :link_configs do
  # meta-task that depends on plugin tasks
end

desc "update the plugins"
task :update => :install do
  # meta-task that depends on plugin tasks
end

task :default => :install
