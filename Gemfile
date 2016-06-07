source 'https://rubygems.org'

# Declare your gem's dependencies in open_close.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :test, :development do
  # gem 'cliver', :git => 'git://github.com/yaauie/cliver', :ref => '5617ce'
  # gem 'wdm'
  # gem 'byebug'
end

group :test do
  gem 'timecop'
  gem 'rspec-rails'
  gem 'faker'
  gem 'database_cleaner', '~> 1.0.0rc'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'guard-rspec'
  # gem 'selenium-webdriver'
  gem 'shoulda'
  # gem 'launchy', '~> 2.3.0'
  # gem 'poltergeist'
end