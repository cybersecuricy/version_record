ENV['RAILS_ENV'] = 'test'
ENV['DATABASE_URL'] = 'sqlite3://localhost/tmp/version_record_test'

require 'bundler/setup'
require 'rails'
require 'byebug'
if Rails.version.start_with?('5.0')
  require 'support/apps/rails5_0'
elsif Rails.version.start_with?('5.1')
  require 'support/apps/rails5_1'
end
require 'support/model_spawner'
require 'version_record'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include VersionRecord::Testing::ModelSpawner

  config.before :each do
    @spawned_models = []
  end

  config.after :each do
    @spawned_models.each do |model|
      Object.instance_eval { remove_const model } if Object.const_defined?(model)
    end
  end
end
