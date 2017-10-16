# rubocop:disable Style/AsciiComments
module Emoji
  module Validator
    # Validates all `string` and `text` attributes of ActiveRecord::Base class
    # Include it in your model to automatically apply the validation
    # ```ruby
    # class Person < ActiveRecord::Base
    #   include Emoji::Validator::NoEmojiAnywhereValidator
    # end
    #
    # person = Person.new(first_name: "😃", last_name: "😃")
    # person.valid? #false
    # person.errors.count #2
    # ```
    module NoEmojiAnywhereValidator
      def self.included(base)
        base.class_eval do
          columns_hash.each do |k, v|
            next unless %i[string text].include?(v.type)
            validates k, no_emoji: true
          end
        end
      end
    end
  end
end
# rubocop:enable Style/AsciiComments
