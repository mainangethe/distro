require_relative 'boot'

require 'rails/all'

require 'csv'
require 'roo'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Distro
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid

      g.text_framework :rspec, view_specs: false, controller_specs: false, routing_specs: false

      g.system_tests = nil
    end
    config.active_job.queue_adapter = :sidekiq
  end
end
