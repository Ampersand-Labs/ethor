require 'bundler/setup'
require 'simplecov'
SimpleCov.start

Bundler.setup

require 'ethor_api' # and any other gems you need

RSpec.configure do |config|
  # some (optional) config here
end