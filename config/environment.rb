
# RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem 'authlogic'
  config.gem 'openrain-action_mailer_tls', :lib => 'smtp_tls.rb', :source => 'http://gems.github.com'
  
  config.plugins = [:white_list, :sanitize_params, :all]
  
  config.frameworks -= [ :active_resource ]

  config.time_zone = 'Eastern Time (US & Canada)'

end
