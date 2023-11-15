# frozen_string_literal: true

module Emoji
  module Validator
    # Validate an attribute against emojis
    #
    #   class Person < ApplicationRecord
    #     validates :first_name, emoji: true
    #   end
    #
    #   person = Person.new(first_name: "😃", last_name: "")
    #   person.valid? #true
    #   person.first_name = ""
    #   person.valid? #false
    #
    class EmojiValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return if value.nil?
        return if value.match(Unicode::Emoji::REGEX_VALID).present?

        record.errors.add(attribute, :no_emojis)
      end
    end
  end
end

ActiveModel::Validations::EmojiValidator = Emoji::Validator::EmojiValidator
