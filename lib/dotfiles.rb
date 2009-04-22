def symlink_dotfile(name)
  source = File.join(DOTFILES_HOME, "dot.#{name}")
  target = File.join(ENV['HOME'], ".#{name}")
  backup_dotfile(target)
  puts "** symlinking #{name}... "
  FileUtils.ln_s source, target
  puts '** done!'
  puts
end
 
def backup_dotfile(target)
  if File.exists?(target)
    name = File.basename(target)
    puts "** moving old #{name} to #{DOTFILES_BACKUPS}/#{name}"
    FileUtils.rm_rf(File.join(DOTFILES_BACKUPS, name))
    FileUtils.mkdir_p(DOTFILES_BACKUPS)
    FileUtils.mv target, File.join(DOTFILES_BACKUPS, name), :force => true
  end
end