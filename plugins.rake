# Global plugin registry
#
# Used for tracking known plugins so cleanup can be done
PLUGINS=[]

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

      desc "install the #{name} plugin"

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

      desc "update the #{name} plugin"
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
  task :install => "plugin:#{name}:install"
  task :update => "plugin:#{name}:update"

end
