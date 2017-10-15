require "spec_helper"

class TestNoEmojiValidator
  include ActiveModel::Model
  validates :first_name, no_emoji: true

  attr_accessor :first_name, :last_name
end

RSpec.describe Emoji::Validator::NoEmojiValidator do


  it "Validates fields that contain emojis" do
    test_object = TestNoEmojiValidator.new(first_name: "😃", last_name: "😃")
    expect(test_object.valid?).to eq(false)
    expect(test_object.errors.count).to eq(1)
    expect(test_object.errors.details[:first_name]).to eq([{error: :has_emojis}])
  end
end
