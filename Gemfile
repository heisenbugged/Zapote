source 'http://rubygems.org'

gem 'rails', '3.0.4'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# UI
gem 'haml', '~> 3.0.21'
gem 'flutie'

# DB
gem 'mongoid', '~> 2.0.0.beta.20'
# Bson and bson_ext have to be the same version
gem 'bson', '~> 1.2.4'
gem 'bson_ext', '~> 1.2.4'

# Controller
gem 'inherited_resources', '~> 1.1.2'

# Other
gem 'simple_form'
gem 'carrierwave'
gem 'jquery-rails', '>= 0.2.6'
gem 'barista'

# Auth
gem 'devise', '~> 1.1.5'
gem "cancan"

# Test gems with generators (available in dev env)
group :development, :test do
  gem 'rspec-core', '~> 2.3.1'
  gem 'rspec-expectations', '~> 2.3.0'
  gem 'rspec-rails', '~> 2.3.1'
  gem 'steak', '>= 1.0.0.rc.4'
  gem 'spork', '>= 0.9.0.rc2'
end

group :development do
  # Server
  gem 'thin', '~> 1.2.7'
end

group :test do
  gem 'rr', '~> 1.0.2'
  gem 'capybara', '~> 0.4.0'
  gem 'launchy', '~> 0.3.7'
  gem 'webrat', '~> 0.7.2', :require => nil
  gem 'azebiki', '~> 0.0.2', :require => nil
  gem 'forgery', '~> 0.3.6'
  gem 'database_cleaner', '~> 0.6.0'
  gem 'remarkable_activemodel', '~> 4.0.0.alpha4', :require => nil
  gem 'remarkable_mongoid', '~> 0.5.0', :require => nil
  #gem 'mongoid-rspec', '~> 1.2.1'
  #gem 'webmock', '~> 1.3.5'
  gem 'timecop', '~> 0.3.5'
  gem 'test_notifier', '~> 0.3.6'
  gem 'autotest', '~> 4.4.5'
end

# Special gems that get reloaded by spork on each run ( no auto require ) (Microoptimization)
gem 'fabrication', '~> 0.9.0', :require => nil, :group => :test
gem 'fabrication', '~> 0.9.0', :group => :development