# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "emoji/validator/version"

Gem::Specification.new do |spec|
  spec.name          = "emoji-validator"
  spec.version       = Emoji::Validator::VERSION
  spec.authors       = ["Bernat Rafales"]
  spec.email         = ["brafales@gmail.com"]

  spec.summary       = %q{ActiveModel validator for emojis}
  spec.description   = %q{ActiveModel validator for emojis, powered by the unicode-emoji gem, to ensure your Models do not contain characters you may not be able to handle}
  spec.homepage      = "https://github.com/brafales/emoji-validator"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "unicode-emoji"
  spec.add_dependency "activemodel", ">= 4"


  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "activerecord", ">= 4"
  spec.add_development_dependency "sqlite3", "~> 1"
end
