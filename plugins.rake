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

task :update_repo do
  sh "git pull"
end

# reload the helptags using the pathogen Helptags command
desc "update the help tags from the installed plugins"
task :helptags do
  puts "updating help tags..."
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
    puts "cleaning unused plugins..."
    unused.each do |dir|
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

task :default => :install


# Define a vim plugin
#
# name   - plugin name
# repo   - optional path to the repo
#
# If a block is provided, it is yielded with the current working directory set
# to the plugin's directory.
#
# Defines install and update rake tasks for the plugin, returns nothing
def plugin(name, repo=nil)
  PLUGINS << name
  namespace "plugin" do
    namespace name do
      plugin_dir = "bundle/#{name}"

      # desc "install the #{name} plugin"

      if File.directory?(plugin_dir)
        task :install do
          # noop, already installed
        end
      else

        if repo
          task :install do
            puts
            puts "*" * 80
            puts "*#{"Installing #{name}".center(78)}*"
            puts "*" * 80
            puts
            if repo
              sh "git clone #{repo} #{plugin_dir}"
            else
              directory plugin_dir
            end
            Dir.chdir(plugin_dir) { yield } if block_given?
          end
        else
          directory plugin_dir do
            puts
            puts "*" * 80
            puts "*#{"Installing #{name}".center(78)}*"
            puts "*" * 80
            puts
            Dir.chdir(plugin_dir) { yield } if block_given?
          end
          task :install => plugin_dir
        end

      end

      # desc "update the #{name} plugin"
      task :update do
        puts
        puts "*" * 80
        puts "*#{"Updating #{name}".center(78)}*"
        puts "*" * 80
        puts
        Dir.chdir(plugin_dir) do
          if File.directory?(".git")
            sh "git pull --stat"
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
