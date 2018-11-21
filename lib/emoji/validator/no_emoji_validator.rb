# frozen_string_literal: true

# rubocop:disable Style/AsciiComments
module Emoji
  module Validator
    # Validate an attribute against emojis
    #
    #   class Person < ApplicationRecord
    #     validates :first_name, no_emoji: true
    #   end
    #
    #   person = Person.new(first_name: "John", last_name: "😃")
    #   person.valid? #true
    #   person.first_name = "😃"
    #   person.valid? #false
    #
    class NoEmojiValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return if value.nil?
        return if value.match(Unicode::Emoji::REGEX_VALID).nil?

        record.errors.add(attribute, :has_emojis)
      end
    end
  end
end

ActiveModel::Validations::NoEmojiValidator = Emoji::Validator::NoEmojiValidator
# rubocop:enable Style/AsciiComments
