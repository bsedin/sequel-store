# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sequel-store'

Gem::Specification.new do |s|
  s.name          = "sequel-store"
  s.version       = SequelStore::VERSION
  s.authors       = ["Sergey Besedin"]
  s.email         = ["kr3ssh@gmail.com"]

  s.summary       = %q{Extension for Sequel}
  s.description   = %q{Allows to use ActiveRecord-like store_accessor on hash fields}
  s.homepage      = "https://github.com/kressh/sequel-store"
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'sequel'

  s.add_development_dependency "bundler", "~> 1.14"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
end
