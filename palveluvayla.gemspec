# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'palveluvayla/version'

Gem::Specification.new do |spec|
  spec.name          = "palveluvayla"
  spec.version       = Palveluvayla::VERSION
  spec.authors       = ["Karri Niemelä"]
  spec.email         = ["kakoni@gmail.com"]

  spec.summary       = %q{Palveluväylä simple ruby client.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "minitest", "~> 5.5.1"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "webmock"
  spec.add_dependency "savon", "~> 2.11.1"
end
