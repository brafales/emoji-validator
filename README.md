# Emoji::Validator

[![Maintainability](https://api.codeclimate.com/v1/badges/f8a989a176a6d58701bb/maintainability)](https://codeclimate.com/github/brafales/emoji-validator/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/f8a989a176a6d58701bb/test_coverage)](https://codeclimate.com/github/brafales/emoji-validator/test_coverage)
[![Build Status](https://travis-ci.org/brafales/emoji-validator.svg?branch=master)](https://travis-ci.org/brafales/emoji-validator)

We all love emojis, but sometimes unfortunately we can't handle them. Use these two validators to seamlessly ensure they don't end up messing up with your models.

Supports ActiveModel > 4

Tested against Ruby 2.3, 2.4, 2.5 and 2.5.1

Depends on the [unicode-emoji](https://rubygems.org/gems/unicode-emoji) gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'emoji-validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emoji-validator

## Usage

Two validators are provided in the gem:

### Disallow emojis on all attributes for your model
Use the `NoEmojiAnywhereValidator` to make all attributes of your ActiveRecord class automatically validate against emojis:
```ruby
class Person < ActiveRecord::Base
  include Emoji::Validator::NoEmojiAnywhereValidator
end

person = Person.new(first_name: "😃", last_name: "😃")
person.valid? #false
person.errors.count #2
```

### Disallow emojis on single attributes for your model
Use the `NoEmojiValidator` to make single attributes of your ActiveRecord class validate against emojis:
```ruby
class Person < ApplicationRecord
  validates :first_name, no_emoji: true
end

person = Person.new(first_name: "John", last_name: "😃")
person.valid? #true
person.first_name = "😃"
person.valid? #false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/emoji-validator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Emoji::Validator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/emoji-validator/blob/master/CODE_OF_CONDUCT.md).
