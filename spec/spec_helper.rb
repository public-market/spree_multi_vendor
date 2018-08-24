require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'

begin
  require File.expand_path('dummy/config/environment', __dir__)
rescue LoadError
  puts 'Could not load dummy application. Please ensure you have run `bundle exec rake test_app`'
  exit
end

require 'ffaker'
require 'rspec/rails'
require 'shoulda/matchers'

Dir[File.join(File.dirname(__FILE__), '/support/**/*.rb')].each { |file| require file }

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = false
  config.fail_fast = false
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.before do
    Rails.cache.clear
  end

  config.order = :random
  Kernel.srand(config.seed)
end
