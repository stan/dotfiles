#!/usr/bin/env ruby

# http://blog.eizesus.com/2009/10/gitproductive-see-how-productive-exactly-are-you
# http://gist.github.com/215383

class GitProductive
  attr_accessor :project_dir, :loc, :commits
	def initialize(project_dir = Dir.pwd)
	  git_test = Dir.entries(project_dir).include?(".git")
	  raise "#{project_dir} is not a git repository" if  !(git_test)
	  @project_dir = project_dir
	  @loc = 0
	  @commits = 0
	end
 
	def check!(duration = "1 days")
 
	  Dir.chdir(@project_dir)
	  output = `git log --shortstat --since="#{duration} ago" | grep insertions`.split("\n")
	  @commits = output.size
 
	  @loc = 0
	  output.each do |commit|
	    @loc += commit.match(/(\d+) insertions/)[0].to_i
	  end
 
	  {:loc => @loc, :commits => @commits}
	end
 
	def stats(duration = "1 days")
	  result = check!(duration)
	  if result[:commits] == 0
	    return 0
	  else
	    return result[:loc].to_f / result[:commits].to_f
	  end
	end
end
 
# Example
git_productive = GitProductive.new(ARGV[0] ||= Dir.pwd)
puts "#{git_productive.stats} lines per commit today"
puts "#{git_productive.stats('3 weeks')} lines per commit in the last 3 weeks"