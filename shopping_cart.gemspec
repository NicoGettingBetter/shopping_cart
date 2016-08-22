$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shopping_cart/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shopping_cart"
  s.version     = ShoppingCart::VERSION
  s.authors     = ["Nicolas Saenko"]
  s.email       = ["nicolas.ozz.com@gmail.com"]
  s.homepage    = "lockalhost:3000"
  s.summary     = "Summary of ShoppingCart."
  s.description = "Description of ShoppingCart."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '~> 5.0.0'
  s.add_dependency 'countries'
  s.add_dependency 'aasm'
  s.add_dependency 'ffaker'
  s.add_dependency 'devise'
  s.add_dependency 'rectify'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'byebug'
  s.add_development_dependency 'shoulda-matchers'
end
