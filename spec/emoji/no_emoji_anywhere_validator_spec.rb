require 'spec_helper'

class TestNoEmojiAnywhereValidator < ActiveRecord::Base
  include Emoji::Validator::NoEmojiAnywhereValidator
end

RSpec.describe Emoji::Validator::NoEmojiAnywhereValidator do
  it 'Validates fields that contain emojis' do
    test_object = TestNoEmojiAnywhereValidator.new(first_name: '😃',
                                                   last_name: '😃')
    expect(test_object.valid?).to eq(false)
    expect(test_object.errors.count).to eq(2)
    expect(test_object.errors.details[:first_name])
      .to eq([
               { error: :has_emojis }
             ])
    expect(test_object.errors.details[:last_name])
      .to eq([
               { error: :has_emojis }
             ])
  end

  it 'Validates fields that contain no emojis' do
    test_object = TestNoEmojiAnywhereValidator.new(first_name: 'John',
                                                   last_name: 'Doe')
    expect(test_object.valid?).to eq(true)
    expect(test_object.errors.count).to eq(0)
    expect(test_object.errors.details[:first_name]).to eq([])
    expect(test_object.errors.details[:last_name]).to eq([])
  end
end
