module Emoji
  module Validator
    class NoEmojiValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return if value.match(Unicode::Emoji::REGEX_ANY).nil?
        record.errors.add(attribute, :has_emojis)
      end
    end
  end
end

ActiveModel::Validations::NoEmojiValidator = Emoji::Validator::NoEmojiValidator
