require "spec_helper"
require "ostruct"

# Is there a better way to do a test of an ActiveRecord class without mocking?
class TestNoEmojiAnywhereValidator
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :age

  def self.columns_hash
    {
      "first_name": OpenStruct.new(type: :string),
      "last_name": OpenStruct.new(type: :string),
      "age": OpenStruct.new(type: :integer),
    }
  end

  include Emoji::Validator::NoEmojiAnywhereValidator
end

RSpec.describe Emoji::Validator::NoEmojiAnywhereValidator do


  it "Validates fields that contain emojis" do
    test_object = TestNoEmojiAnywhereValidator.new(first_name: "😃", last_name: "😃")
    expect(test_object.valid?).to eq(false)
    expect(test_object.errors.count).to eq(2)
    expect(test_object.errors.details[:first_name]).to eq([{error: :has_emojis}])
    expect(test_object.errors.details[:last_name]).to eq([{error: :has_emojis}])
  end
  
  it "Validates fields that contain no emojis" do
    test_object = TestNoEmojiAnywhereValidator.new(first_name: "John", last_name: "Doe")
    expect(test_object.valid?).to eq(true)
    expect(test_object.errors.count).to eq(0)
    expect(test_object.errors.details[:first_name]).to eq([])
    expect(test_object.errors.details[:last_name]).to eq([])
  end

end
