require 'rake/clean'

CLOBBER.include('doc')

begin
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "--format pretty"
  end
  task :features => ['db:test:prepare', 'yougo:load_default_data']

  namespace :features do
    Cucumber::Rake::Task.new(:rcov) do |t|
      t.rcov = true
      t.rcov_opts = %w{--rails --exclude osx\/objc,gems\/,spec\/}
      t.rcov_opts = ['-o doc\/features --text-report --exclude config\/,features\/,spec\/']
    end
    task :rcov => ['db:test:prepare', 'yougo:load_default_data']

    Cucumber::Rake::Task.new(:focus) do |t|
      t.cucumber_opts = "-t focus --format pretty"
    end
    task :features => ['db:test:prepare', 'yougo:load_default_data']
  end
  
rescue LoadError
  desc 'Cucumber rake task not available'
  task :features do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end
end
