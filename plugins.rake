# Quiet, please (sh commands in particular)
verbose false

# Global plugin registry, used for tracking known plugins for cleanup
PLUGINS=[]

task :install_plugins do
  # hook task for the plugins to use
end

task :update_plugins do
  # hook task for the plugins to use
end

# link the .vimrc and .gvimrc files
task :link_configs do
  dotvim = File.expand_path("~/.vim")
  unless File.exist?(dotvim)
    puts "* linking .vim"
    ln_s(Dir.pwd, dotvim)
  end

  %w[ vimrc gvimrc ].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      puts "* linking #{file}"
      ln_s(File.expand_path(file), dest)
    end
  end
end

task :update_repo do
  # sh "git pull"
end

# reload the helptags using the pathogen Helptags command
desc "update the help tags from the installed plugins"
task :helptags do
  puts "* updating help tags..."
  sh "vim -c Helptags -c qa"
end

desc "clean up unknown plugins"
task :clean do
  unused = Dir.glob("./bundle/*").select do |file|
    File.directory?(file)
  end.reject do |dir|
    PLUGINS.include? File.basename(dir)
  end
  if unused.size > 0
    puts "* Removing unused plugins..."
    unused.each do |dir|
      puts "  #{dir}..."
      rm_rf dir
    end
  end
end

# install: link, install, clean, helptags
desc "install the vimfiles and plugins (default)"
task :install => [:link_configs, :install_plugins, :clean, :helptags] do
end

desc "update the vim distribution and plugins"
task :update => [:update_repo, :install_plugins, :clean, :update_plugins, :helptags] do
end

task :default => :update


# Define a vim plugin
#
# name - plugin name
# repo - optional path to the repo
# type - optional, defaults to :git. :hg for mercurial repos.
#
# If a block is provided, it is yielded with the current working directory set
# to the plugin's directory.
#
# Defines install and update rake tasks for the plugin, returns nothing
def plugin(name, repo=nil, type=:git)
  PLUGINS << name
  namespace "plugin" do
    namespace name do
      plugin_dir = "bundle/#{name}"

      if File.directory?(plugin_dir)
        task :install do
          # noop, already installed
        end
      else

        if repo
          task :install do
            puts "* Installing #{name}..."
            if repo
              clone type, repo, plugin_dir
            else
              directory plugin_dir
            end
            Dir.chdir(plugin_dir) { yield } if block_given?
          end
        else
          directory plugin_dir do
            puts "* Installing #{name}..."
            Dir.chdir(plugin_dir) { yield } if block_given?
          end
          task :install => plugin_dir
        end

      end

      # desc "update the #{name} plugin"
      task :update do
        puts "* Updating #{name}..."
        Dir.chdir(plugin_dir) do
          if File.directory?(".git")
            pull type
          end
          yield if block_given?
        end
      end
    end

  end

  # hook up the plugin tasks
  task :install_plugins => ["plugin:#{name}:install"]
  task :update_plugins => ["plugin:#{name}:update"]

end

def clone(type, repo, dir)
  case type
  when :git
    sh "git clone #{repo} #{dir}"
  when :hg
    sh "hg clone #{repo} #{dir}"
  else
    raise "unknown repo type #{type}"
  end
end

def pull(type)
  case type
  when :git
    head = `git rev-parse HEAD`
    out = `git pull --log --stat 2>&1`
    if $? != 0
      puts out.split("\n").map { |l| "  #{l}" }.join("\n")
    end
    new_head = `git rev-parse HEAD`
    if new_head != head
      sh "git --no-pager log --pretty='  * %C(yellow)%h%Creset %s' @{1}.."
    end
  when :hg
    sh "hg incoming && hg pull -u"
  end
end

def try(cmd)
  sh cmd do |ok, res|
    if !ok
      puts "#{cmd} exited with code #{res}"
    end
  end
end
