begin
  require 'jeweler'

  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "fester"
    gemspec.summary = "Manifest management for small drop zones"
    gemspec.email = "bryan.a.ash@gmail.com"
    gemspec.homepage = "http://github.com/bryan-ash/fester"
    gemspec.description = gemspec.summary
    gemspec.authors = ["Bryan Ash"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

