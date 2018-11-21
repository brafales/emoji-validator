# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emoji/validator/version'

# rubocop:disable Metrics/LineLength
Gem::Specification.new do |spec|
  spec.name                  = 'emoji-validator'
  spec.version               = Emoji::Validator::VERSION
  spec.authors               = ['Bernat Rafales']
  spec.email                 = ['brafales@gmail.com']

  spec.summary               = 'ActiveModel validator for emojis'
  spec.description           = 'ActiveModel validator for emojis, powered by the unicode-emoji gem, to ensure your Models do not contain characters you may not be able to handle'
  spec.homepage              = 'https://github.com/brafales/emoji-validator'
  spec.license               = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir                = 'exe'
  spec.executables           = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.required_ruby_version = ['>= 2.2.8', '< 2.6.0']
  spec.require_paths         = ['lib']

  spec.add_dependency 'activemodel', '>= 4'
  spec.add_dependency 'unicode-emoji'

  spec.add_development_dependency 'activerecord', '>= 4'
  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'sqlite3', '~> 1'
end
# rubocop:enable Metrics/LineLength
