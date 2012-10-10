# -*- encoding: utf-8 -*-
require File.expand_path('../lib/seo_fuel/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Henk Meijer"]
  gem.email         = ["meijerhenk@gmail.com"]
  gem.description   = "Customize the SEO options for every single page of your rails app. Each url has its own SEO options."
  gem.summary       = "Add exstensive SEO options to every page on your website."
  gem.homepage      = "https://github.com/henkm/seo_fuel"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  
  gem.add_development_dependency "rake"
  
  gem.name          = "seo_fuel"
  gem.require_paths = ["lib"]
  gem.version       = SeoFuel::VERSION
end
