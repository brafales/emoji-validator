# frozen_string_literal: true

require 'spec_helper'

class TestEmojiValidator
  include ActiveModel::Model
  validates :first_name, emoji: true
  validates :last_name, emoji: true

  attr_accessor :first_name, :last_name
end

RSpec.describe Emoji::Validator::EmojiValidator do
  it 'ignore nil values' do
    test_object = TestEmojiValidator.new(first_name: '😃', last_name: '😃')

    expect(test_object.valid?).to eq(true)
  end

  it 'Validates fields that contain no emojis' do
    test_object = TestEmojiValidator.new(first_name: '',
                                         last_name: '')

    expect(test_object.valid?).to eq(false)
    expect(test_object.errors.count).to eq(2)
    expect(test_object.errors.details[:first_name])
      .to eq([{ error: :no_emojis }])
    expect(test_object.errors.details[:last_name])
      .to eq([{ error: :no_emojis }])
  end
end
