DOTFILES_HOME = File.dirname(__FILE__)
DOTFILES_BACKUPS = File.join(DOTFILES_HOME, 'backups')
 
require 'lib/dotfiles'
 
task :default => [:install]
 
desc "Install dotfiles"
task :install do
  symlink_dotfile "bash_profile"
  symlink_dotfile "gitconfig"
  symlink_dotfile "gemrc"
  symlink_dotfile "irbrc"
  symlink_dotfile "vimrc"
  puts "\nNow run this command to reload the shell:\n\n"
  puts "  source ~/.bash_profile\n\n"
end
 
namespace :backups do
  desc "Clean backups"
  task :clean do
    print "=> removing #{DOTFILES_BACKUPS}... "
    FileUtils.rm_rf(DOTFILES_BACKUPS)
    puts "done!"
  end
  
  desc "Restore backups"
  task :restore do
    print "=> restoring from backups... "
    FileUtils.mv File.join(DOTFILES_BACKUPS, '*'), File.join(ENV['HOME']), :force => true
    puts "done!"
  end
end