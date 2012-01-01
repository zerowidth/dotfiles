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

desc "install vimfiles"
task :install => :link_configs do
end

task :default => :install
