require 'byebug'
require 'simplecov'
require './lib/main'

SimpleCov.start

RSpec.configure do |config|
  # Use the specified formatter
  config.formatter = :documentation
end
