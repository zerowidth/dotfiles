begin
  require "forkoff"
  Forkoff.default["processes"] = 16
rescue LoadError
  abort "gem install --user forkoff"
end

require "fileutils"
require "open3"

# Global plugin registry, used for tracking defined plugins
PLUGINS=[]

desc "install the vimfiles and plugins"
task :install do
  PLUGINS.map do |plugin|
    next if plugin.exists?
    puts "* Installing #{plugin.name}"
    plugin.install
  end
end

desc "update all plugins"
task :update do
  print "* Updating #{PLUGINS.length} plugins "

  updates = PLUGINS.forkoff do |plugin|
    begin
      update = plugin.update
      print "."
      [plugin.name, update]
    rescue => e
      print "E"
      [plugin.name, e]
    end
  end
  puts

  failed = false
  updates.each do |name, update|
    case update
    when Plugin::CommandFailed
      puts "* Failed to update #{name}:"
      puts update.previous_output.split("\n").map { |l| l.prepend("  ") }.join("\n")
      puts update.message
      failed = true
    when Exception
      puts "* Failed to update #{name}:"
      puts update
      failed = true
    end
    if update.kind_of?(Exception)
    else
      next if update.empty?
      puts "* Updated #{name}:"
      puts update.split("\n").map { |l| l.prepend("  ") }.join("\n")
    end
  end

  abort if failed
end

desc "clean up unused plugins"
task :clean do
  unused = Dir.glob("./bundle/*").select do |file|
    File.directory?(file)
  end.reject do |dir|
    PLUGINS.detect { |plug| plug.name == File.basename(dir) }
  end
  if unused.size > 0
    puts "* Removing unused plugins"
    unused.each do |dir|
      puts "  #{dir}"
      rm_rf dir
    end
  end
end

desc "symlink ~/.vim, ~/.vimrc, and ~/.gvimrc"
task :link_configs do
  dotvim = File.expand_path("~/.vim")
  unless File.exist?(dotvim)
    puts "* linking .vim"
    ln_s(Dir.pwd, dotvim)
  end

  %w( ~/.vimundo ~/.vimswap ).each do |file|
    expanded = File.expand_path(file)
    unless File.directory?(expanded)
      puts "* creating #{file}"
      FileUtils.mkdir_p expanded
    end
  end

  %w[ vimrc gvimrc ].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      puts "* linking #{file}"
      ln_s(File.expand_path(file), dest)
    end
  end
end

# reload the helptags using the pathogen Helptags command
desc "update the helptags from the installed plugins"
task :helptags do
  puts "* Updating helptags"
  sh "vim -c Helptags -c qa"
end

task :default => [:link_configs, :clean, :install, :update, :helptags]

task :foo do
  plugin = PLUGINS.detect { |p| p.name == "vimproc" }
  up = plugin.update
  puts "up: #{up.inspect}"
end

# Define a vim plugin
#
# name      - plugin name, this is the directory the plugin is installed to
# repo      - optional path to the repo
# commands: - optional array of installation commands. Allowed alongside or in
#             addition to a repo.
#
# If a block is provided, it is yielded with the current working directory set
# to the plugin's directory.
def plugin(name, repo=nil, type=:git, commands: [])
  PLUGINS << Plugin.new(name, repo: repo, commands: commands)
end

class Plugin

  class CommandFailed < StandardError
    attr_reader :previous_output
    def initialize(message, previous_output="")
      super message
      @previous_output = previous_output
    end
  end

  attr_reader :name
  attr_reader :updates

  def initialize(name, repo: nil, commands: [])
    @name     = name
    @repo     = repo
    @commands = commands
    @updated  = false
    @updates = ""
  end

  def install
    return if exists?

    if @repo
      puts sh("git clone #{@repo} #{plugin_dir}")
    else
      FileUtils.mkdir_p plugin_dir
    end

    Dir.chdir(plugin_dir) do
      run_install_commands do |output|
        puts output
      end
    end
  rescue
    FileUtils.rmdir plugin_dir
    raise
  end

  def update
    return "" unless exists?
    updates = ""
    Dir.chdir(plugin_dir) do
      if File.directory?(".git")
        head = sh "git rev-parse HEAD"
        sh "git pull --log --stat"
        if sh("git rev-parse HEAD") != head
          updates = sh("git --no-pager log --pretty='* %C(yellow)%h%Creset %s' @{1}..")
          run_install_commands do |output|
            updates << output
          end
        end
      end
    end
    updates
  rescue CommandFailed => e
    raise CommandFailed.new(e.message, updates)
  end

  def run_install_commands(&block)
    @commands.each do |cmd|
      out = sh(cmd)
      next if out.empty?
      yield out
    end
  end

  def exists?
    File.directory? plugin_dir
  end

  def updated?
    @updated
  end

  def plugin_dir
    "bundle/#{@name}"
  end

  def sh(cmd)
    out, status = Open3.capture2e(cmd)
    unless status.success?
      raise CommandFailed, "Command failed with status (#{status.exitstatus}): #{cmd}\n#{out}"
    end
    out
  rescue => e
    raise CommandFailed, "Command failed: #{cmd}\n#{e.inspect}"
  end
end
