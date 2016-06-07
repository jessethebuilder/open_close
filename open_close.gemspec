$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "open_close/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "open_close"
  s.version     = OpenClose::VERSION
  s.authors     = ["Jesse Farmer"]
  s.email       = ["jesse@anysoft.us"]
  s.homepage    = "http://anysoft.us"
  s.summary     = "Open/Close module"
  s.description = "Rails model for managing open and close times of businesses or availability of services/products"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"

# s.add_development_dependency 'rspec-rails'
# s.add_development_dependency 'capybara'
# s.add_development_dependency 'factory_girl_rails'

s.test_files = Dir["spec/**/*"]
end
