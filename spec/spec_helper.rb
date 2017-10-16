require 'bundler/setup'
require 'emoji/validator'
require 'active_record'

require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

# Set up ActiveRecord database for tests
active_record = ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

active_record.connection.execute <<-SQL
  create table test_no_emoji_anywhere_validators (
    first_name varchar(30),
    last_name text,
    val int
  );
SQL
