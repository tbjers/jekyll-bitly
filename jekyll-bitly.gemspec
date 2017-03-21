# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-bitly/version"

Gem::Specification.new do |spec|
  spec.name                  = "jekyll-bitly"
  spec.version               = Jekyll::BitlyFilter::VERSION
  spec.authors               = ["Torgny Bjers"]
  spec.email                 = ["torgny.bjers@gmail.com"]

  spec.summary               = "Jekyll article bitly list tag"
  spec.description           = "Generates an article bitly list from Markdown front-matter."
  spec.homepage              = "https://github.com/tbjers/jekyll-bitly-plugin"
  spec.license               = "MIT"
  spec.required_ruby_version = ">= 2.0.0"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "bitly", "~> 1.1.0"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "jekyll", ">= 2.0"
  spec.add_development_dependency "rubocop", "~> 0.47.1"
  spec.add_development_dependency "byebug" if RUBY_VERSION >= "2.0"
end
