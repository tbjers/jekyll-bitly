# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-bitly/version"

Gem::Specification.new do |spec|
  spec.name                  = "jekyll-bitly"
  spec.version               = Jekyll::BitlyFilter::VERSION
  spec.authors               = ["Torgny Bjers"]
  spec.email                 = ["torgny.bjers@gmail.com"]

  spec.summary               = "Jekyll Bit.ly filter"
  spec.description           = "Jekyll filter that uses Bit.ly to shorten URLs."
  spec.homepage              = "https://github.com/tbjers/jekyll-bitly"
  spec.license               = "MIT"
  spec.required_ruby_version = ">= 2.0.0"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "bitly", "~> 3.0.0"
  spec.add_runtime_dependency "dry-core", "~> 1.0.0"

  spec.add_development_dependency "bundler", "~> 2.4.13"
  spec.add_development_dependency "rake", "~> 13"
  spec.add_development_dependency "rspec", "~> 3"
  spec.add_development_dependency "jekyll", "~> 4.3.2"
  spec.add_development_dependency "rubocop", "~> 0.47.1"
  spec.add_development_dependency "byebug" if RUBY_VERSION >= "2.0"
end
