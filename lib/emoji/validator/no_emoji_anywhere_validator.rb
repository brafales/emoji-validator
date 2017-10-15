module Emoji
  module Validator
    module NoEmojiAnywhereValidator
      def self.included(base)
        base.class_eval do
          columns_hash.each do |k, v|
            next unless [:string, :text].include?(v.type)
            validates k, no_emoji: true
          end
        end
      end
    end
  end
end
