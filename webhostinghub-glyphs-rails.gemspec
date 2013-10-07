# -*- encoding: utf-8 -*-
require File.expand_path('../lib/webhostinghub-glyphs-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["bokmann"]
  gem.email         = ["dbock@codesherpas.com"]
  gem.description   = "Webhostinghub-glyphs icons for Rails asset pipeline."
  gem.summary       = "an asset gemification of the webhostinghub-glyphs icon font library"
  gem.homepage      = "https://github.com/avanes/webhostinghub-glyphs-rails"
  gem.licenses      = ["MIT", "SIL Open Font License"]

  gem.files         = Dir["{app,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  gem.test_files    = Dir["test/**/*"]
  gem.name          = "webhostinghub-glyphs-rails"
  gem.require_paths = ["lib"]
  gem.version       = WebhostinghubGlyphs::Rails::VERSION

  gem.add_dependency "railties", ">= 3.2", "< 5.0"

  gem.add_development_dependency "activesupport"
  gem.add_development_dependency "tzinfo"
  gem.add_development_dependency "sass-rails"
end
